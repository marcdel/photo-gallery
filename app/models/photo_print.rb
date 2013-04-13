class PhotoPrint < ActiveRecord::Base
  attr_accessible :photo_id, :print_id
  belongs_to :photo
  belongs_to :print

  validates :photo_id, presence: true
  validates :print_id, presence: true
end
