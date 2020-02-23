class Sneaker < ApplicationRecord
  belongs_to :user, optional: true

  has_many :reviews
  has_many :users, through: :reviews


  validates :name, presence: true
  validates :name, length: {minimum: 3}
  validates :name, uniqueness: true

  validate :price_range

  def price_range #an attempt to give a price cap to price
    if self.price > 500
      errors.add(:price, "$500!? No shoe is worth that amount.")
    end
  end

end
