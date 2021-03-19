class Comment < ApplicationRecord
  belongs_to :feed
  validates :content, presence: true
end
