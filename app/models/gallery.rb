class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :cover

  self.per_page = 6

  has_attached_file :cover, styles: { lightbox: "1024x768>", thumb: "300x300>" }

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
end
