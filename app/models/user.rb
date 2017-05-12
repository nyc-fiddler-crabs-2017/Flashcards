class User < ApplicationRecord
  include BCrypt
  has_many :rounds
  has_secure_password

validates :password_digest, :email, :username, presence: true
validates :email, :username, uniqueness: true

end
