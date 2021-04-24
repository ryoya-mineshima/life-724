class Tweet < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
