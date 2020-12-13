class FollowSerializer < ActiveModel::Serializer
  has_one :user
end
