class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :users, optional: true
end
