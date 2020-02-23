class User < ApplicationRecord
  has_many :reviews
  has_many :sneakers, through: :reviews

  validates :username, uniqueness: true, presence: true
  has_secure_password #gives us authenticate method, validation for password is true

  # def self.current
  #   Thread.current[:user]
  # end
  #
  # def self.current=(user)
  #   Thread.current[:user] = user
  # end
end
