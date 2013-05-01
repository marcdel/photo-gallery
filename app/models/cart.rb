class Cart < ActiveRecord::Base
  attr_accessible :purchased_at
  has_many :line_items

  def total_price
    # Convert to array so that the sum is not done in the database
    line_items.to_a.sum(&:total_price)
  end

  def paypal_encrypted(return_url, notify_url)
    values = {
        :business => ENV['PAYPAL_EMAIL'],
        :cmd => '_cart',
        :upload => 1,
        :return => return_url,
        :invoice => id,
        :notify_url => notify_url,
        :cert_id => ENV['PAYPAL_CERT_ID']
    }

    line_items.each_with_index do |item, index|
      values.merge!({
                        "amount_#{index+1}" => item.price,
                        "item_name_#{index+1}" => item.photo_print.photo.title,
                        "item_number_#{index+1}" => item.id,
                        "quantity_#{index+1}" => item.quantity
                    })
    end

    encrypt_for_paypal(values)
  end

  PAYPAL_CERT_PEM = ENV['PAYPAL_CERT_PEM']
  APP_CERT_PEM = ENV['APP_CERT_PEM']
  APP_KEY_PEM = ENV['APP_KEY_PEM']

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end
end
