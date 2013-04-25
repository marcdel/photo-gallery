class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

  private

  def mark_cart_as_purchased
    if status == 'Completed' && params[:secret] == ENV['PAYPAL_SECRET'] &&
        params[:receiver_email] == ENV['PAYPAL_EMAIL'] &&
        params[:mc_gross] == cart.total_price.to_s && params[:mc_currency] == 'USD'
      cart.update_attribute(:purchased_at, Time.now)
    end
  end
end
