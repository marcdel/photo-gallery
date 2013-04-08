class Photo < ActiveRecord::Base
  attr_accessible :title, :image
  has_attached_file :image, styles: { lightbox: "1024x768>", thumb: "300x300>" }

  default_scope order: "photos.created_at DESC"
  self.per_page = 6

  validates :title, presence: true, length: { maximum: 50 }
  validates_attachment_presence :image

  belongs_to :gallery
end
