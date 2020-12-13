class Api::V1::TweetsController < ApplicationController
  before_action :set_tweet, only: [:update, :destroy]

  def create
    @tweet = current_user.tweets.create!(tweet_params)
    json_response(@tweet)
  end

  def update
    @tweet.update!(tweet_params)
    json_response(@tweet)
  end

  def destroy
    @tweet.destroy!
    json_response("Tweet deleted successfully!")
  end

  private

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweets).permit(:message, :location, :media)
  end
end
