class User < ApplicationRecord
  has_many :reviews
  has_many :sneakers, through: :reviews

  validates :username, uniqueness: true, presence: true
  has_secure_password #gives us authenticate method, validation for password is true

  def self.github_login(auth)
    self.find_or_create_by(username: auth[:info][:nickname]) do |u|
      u.password = SecureRandom.hex
    end
  end

end #end of class
