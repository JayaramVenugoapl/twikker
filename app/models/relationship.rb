class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :follow, class_name: "User"

  counter_culture :followed, column_name: :following_count
  counter_culture :follower, column_name: :followers_count

end
