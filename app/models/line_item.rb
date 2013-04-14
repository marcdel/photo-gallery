class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :print_id, :cart, :print, :price, :quantity

  belongs_to :cart
  belongs_to :print

  validates :cart_id, presence: true
  validates :price, presence: true
  validates :print_id, presence: true
  validates :quantity, presence: true

  def total_price
    price * quantity
  end
end
