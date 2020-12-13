class Api::V1::RegistrationController < ApplicationController
  skip_before_action :authorize_request, :only => :create

  def create
    @user = User.create!(user_params)
    json_response(
      UserSerializer.new(@user),
      Message.account_created,
      :created
    )
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :date_of_birth
    )
  end
end
