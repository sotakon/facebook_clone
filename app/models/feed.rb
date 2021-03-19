class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  validates :content, presence: true
  validates :image, presence: true
end
