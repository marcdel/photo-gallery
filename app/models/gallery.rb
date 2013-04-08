class Gallery < ActiveRecord::Base
  attr_accessible :title, :description

  self.per_page = 6

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
end
