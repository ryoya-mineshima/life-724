class Tweet < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :image, presence: true

  belongs_to :user
  has_many :comments
  has_one_attached :image
end
