class Print < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  attr_accessible :width, :height, :price, :print_type
  has_many :photo_prints, dependent: :destroy
  has_many :photos, through: :photo_prints

  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :print_type, length: { maximum: 50 }

  def name
    "#{width} x #{height} #{print_type} Print #{number_to_currency(price)}"
  end
end
