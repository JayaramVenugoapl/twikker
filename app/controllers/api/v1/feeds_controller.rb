class Api::V1::FeedsController < ApplicationController
  def index
    @tweets = Tweet.joins(:user).where("user_id in (?) OR user_id = ?", current_user.following_ids, current_user).paginate(page: params[:page] || 1).order("created_at DESC")
    json_response({ tweets: serializer!(@tweets, TweetSerializer) })
  end
end
