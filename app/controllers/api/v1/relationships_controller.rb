class Api::V1::RelationshipsController < ApplicationController
  def create
    @user = User.find(follow_params[:following_id])
    current_user.follow!(@user)
    json_response(UserSerializer.new(@user))
  end

  def destroy
    @user = Follow.find(params[:id]).following
    current_user.unfollow!(@user)
    json_response("Unfollowed!")
  end

  private

  def follow_params
    params.require(:relationship).permit(:following_id)
  end
end
