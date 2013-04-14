class Cart < ActiveRecord::Base
  attr_accessible :purchased_at
  has_many :line_items

  def total_price
    # Convert to array so that the sum is not done in the database
    line_items.to_a.sum(&:total_price)
  end

  def paypal_url(return_url, notify_url)
    values = {
        :business => "user@email.com",
        :cmd => "_cart",
        :upload => 1,
        :return => return_url,
        :invoice => id,
        :notify_url => notify_url
    }
    line_items.each_with_index do |item, index|
      values.merge!({
                        "amount_#{index+1}" => item.price,
                        "item_name_#{index+1}" => item.photo_print.photo.title,
                        "item_number_#{index+1}" => item.id,
                        "quantity_#{index+1}" => item.quantity
                    })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
