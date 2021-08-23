class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :photo, PhotoUploader
  
  validates :content, presence: true, length: { maximum: 255 }
end
