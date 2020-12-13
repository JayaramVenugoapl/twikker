class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :about, :location, :website, :tweets_count, :followers_count, :following_count, :date_of_birth, :image_url, :cover_url
end
