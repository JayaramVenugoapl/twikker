class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include SerializableResource

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
  end
end
