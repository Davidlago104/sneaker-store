class Sneaker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :users, through: :reviews
  has_one_attached :sneaker

  validates :name, uniqueness: true
  # validates :name, presence: { scope: :review, message}
  validates :name, length: {minimum: 3}

  validates :description, presence: true

  def self.ordered
    order(:name) #alphabetically ordered shoes by name
  end

  scope :pricing, -> { where("price < 500") }
  scope :over_price, -> { where("price > 500") }

  # scope :jordan_1, -> { where("name = jordan 1") } #doesn't work yet

  validate :price_range



  def price_range #an attempt to give a price cap to price
    if self.price > 500
      errors.add(:price, "$500!? No shoe is worth that amount.")
    end
  end

end
