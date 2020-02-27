class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sneakers, optional: true

  validates :stars, presence: true
  validates :stars, numericality: { greater_than: 0}
  validates :stars, numericality: { less_than: 5}
  validates :title, presence: true
  validates :thoughts, presence: true

end
