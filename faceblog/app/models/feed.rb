class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  validates :content, presence: true
  validates :image, presence: true
end
