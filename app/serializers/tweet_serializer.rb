class TweetSerializer < ActiveModel::Serializer
  attributes :id, :message, :media_url
  has_one :user
end
