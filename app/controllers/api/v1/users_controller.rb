class Api::V1::UsersController < ApplicationController
  def show
    json_response(UserSerializer.new(current_user))
  end

  def update
    current_user.update!(user_params)
    json_response(UserSerializer.new(current_user))
  end

  def following
    @users = current_user.following.paginate(page: params[:page] || 1)
    json_response({ users: serializer!(@users, UserSerializer) })
  end

  def followers
    @users = current_user.followers.paginate(page: params[:page] || 1)
    json_response({ users: serializer!(@users, UserSerializer) })
  end

  def likes
    @likes = @user.tweets.joins(:favorites).paginate(page: params[:page] || 1)
    json_response({ users: serializer!(@favorites, LikeSerializer) })
  end

  def retweets
    @retweets = @user.retweets.paginate(page: params[:page] || 1).order("created_at DESC")
    json_response({ users: serializer!(@retweets, RetweetSerializer) })
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :about, :location, :website, :image, :cover)
  end
end
