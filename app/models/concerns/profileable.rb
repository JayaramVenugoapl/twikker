module Profileable
  extend ActiveSupport::Concern
  include ::Media

  included do
    has_many :likes
    has_many :tweets
    has_many :follows
    has_many :followed_users, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
    has_many :followers, through: :followed_users, source: :follower
    has_many :following_users, class_name: "Follow", foreign_key: "user_id", dependent: :destroy
    has_many :following, through: :following_users, source: :following
    has_many :retweets, foreign_key: "retweeter_id"

    before_validation :set_username
    before_create { self.email = email.downcase }

    validates :name, :presence => true, :length => { :maximum => 50 }
    validates :email, :presence => true, :length => { :maximum => 255 },
                      :format => { :with => VALID_EMAIL_REGEX },
                      :uniqueness => { :case_sensitive => false }
    validates :password, :presence => true, :length => { :minimum => 6 }, on: :create
    validates :date_of_birth, :presence => true
    validates :username, :presence => true, :uniqueness => { :case_sensitive => false }

    has_one_attached :image, dependent: :destroy
    has_one_attached :cover, dependent: :destroy
  end

  def following?(other_user)
    follows.find_by_following_id(other_user.id)
  end

  def follow!(other_user)
    follows.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    follows.find_by_following_id(other_user.id).destroy
  end

  def image_url
    url!(self.image)
  end

  def cover_url
    url!(self.cover)
  end

  private

  def set_username
    self.username = self.email[/^[^@]+/] + SecureRandom.alphanumeric(2)
  end
end
