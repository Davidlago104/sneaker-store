class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneakers, optional: true

  validates :stars, presence: true
  validates :title, presence: true
  validates :thoughts, presence: true

end
