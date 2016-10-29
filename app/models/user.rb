require 'bcrypt'

class User < ActiveRecord::Base
	has_many :essays

	include BCrypt
  validates :email,  uniqueness: true, presence: true, length: { maximum: 50 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 3 }
end
