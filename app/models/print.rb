class Print < ActiveRecord::Base
  attr_accessible :width, :height, :price, :print_type

  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :print_type, length: { maximum: 50 }
end
