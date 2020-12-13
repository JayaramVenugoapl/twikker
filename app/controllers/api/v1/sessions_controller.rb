class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorize_request, :only => :create

  def create
    authenticate auth_params[:email], auth_params[:password]
  end

  private

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)
    json_response(command.result, "Logged In") if command.success?
  end

  def auth_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end
