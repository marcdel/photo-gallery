class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :photo_print_id, :cart, :photo_print, :price, :quantity

  belongs_to :cart
  belongs_to :photo_print

  validates :cart_id, presence: true
  validates :price, presence: true
  validates :photo_print_id, presence: true
  validates :quantity, presence: true

  def total_price
    price * quantity
  end
end
