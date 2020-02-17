class User < ApplicationRecord
  has_many :reviews
  has_many :sneakers, through: :reviews
end
