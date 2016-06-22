class Photo < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  validates :image, file_size: { less_than: 2.megabytes }
  mount_uploader :image, PhotoUploader
  
end
