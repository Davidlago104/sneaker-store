class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneakers, optional: true
end
