class Tweet < ApplicationRecord
  include ::Media
  self.per_page = 20

  belongs_to :user
  has_many :likes

  belongs_to :parent, class_name: "Tweet", optional: true
  has_many :replies, class_name: "Tweet", foreign_key: "parent_id"
  has_many :retweets, foreign_key: "source_tweet_id"

  counter_culture :user

  validates :message, presence: true, length: { maximum: 140 }

  has_one_attached :media, dependent: :destroy

  def media_url
    url!(self.media)
  end
end
