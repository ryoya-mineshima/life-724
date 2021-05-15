class Tweet < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :content
    validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
    validates :image
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  def self.search(search)
    if search != ""
      Tweet.where('content LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
