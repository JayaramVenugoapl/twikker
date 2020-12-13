class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user
      token = JsonWebToken.encode(:user_id => user.id) 
      users = UserSerializer.new(user)
      return { :users => users, :token => token }
    end
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(:email => email)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
  
end