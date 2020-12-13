class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
  belongs_to :following, class_name: "User"

  counter_culture :following, column_name: :following_count
  counter_culture :follower, column_name: :followers_count

  validate :not_following_himself
  validates_uniqueness_of :user_id, scope: :following_id, message: "already follow"

  private

  def not_following_himself
    errors.add(:user_id, "cannot follow yourself.") if following_id == user_id
  end
end
