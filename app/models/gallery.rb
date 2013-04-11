class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :cover
  has_attached_file :cover, styles: { lightbox: "1024x768>", thumb: "300x300>" }

  default_scope order: "galleries.created_at DESC"
  self.per_page = 6

  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates_attachment_presence :cover
end
