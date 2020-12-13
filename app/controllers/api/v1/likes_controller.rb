class Api::V1::LikesController < ApplicationController
  before_action :set_likes, only: :destroy

  def like
    @like = current_user.likes.create!(tweet_id: params[:tweet_id])
    json_response(@like)
  end

  def unlike
    @like.destroy!
    json_response("Unlike tweet!")
  end

  private

  def set_likes
    @like = current_user.likes.find_by_tweet_id(params[:id])
  end
end
