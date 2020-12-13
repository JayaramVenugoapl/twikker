module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class DecodeError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, :with => :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, :with => :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, :with => :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, :with => :four_twenty_two
    rescue_from ExceptionHandler::ExpiredSignature, :with => :four_ninety_eight
    rescue_from ExceptionHandler::DecodeError, :with => :four_zero_one

    rescue_from ActiveRecord::RecordInvalid do |e|
      to_json(e.message, :unprocessable_entity)
    end

    rescue_from ActionController::ParameterMissing do |e|
      to_json(e.message, :bad_request)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      to_json(e.message, :not_found)
    end
  end

  private

  def four_twenty_two(e)
    to_json(e.message, :unprocessable_entity)
  end

  def four_ninety_eight(e)
    to_json(Message.invalid_token, 409)
  end

  def four_zero_one(e)
    to_json(e.message, 401)
  end

  def unauthorized_request(e)
    to_json(e.message, :unauthorized)
  end

  def to_json(object, status, meta = "")
    render :json => { :error => object, :meta => meta }, :status => status
  end
end
