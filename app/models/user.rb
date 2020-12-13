class User < ApplicationRecord
  has_secure_password
  include Rails.application.routes.url_helpers
  include ::Profileable
end
