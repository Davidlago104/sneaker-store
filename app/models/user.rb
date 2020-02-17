class User < ApplicationRecord
  has_many :reviews
  has_many :sneakers, through: :reviews
  has_secure_password #gives us authenticate method, validation for password is true
end
