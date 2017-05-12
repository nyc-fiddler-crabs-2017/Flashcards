class User < ApplicationRecord
  include BCrypt
  has_many :rounds
  has_secure_password
end
