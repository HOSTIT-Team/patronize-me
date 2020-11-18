class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :banner

  CITY = ["Amsterdam", "Berlin", "London", "Paris"]
  CATEGORY = ["DJ", "Live", "Music", "Painting", "Dance", "Singing", "Acting"]
  DELIVERY = ["Deadline", "Day"]

  validates :title, :category, :price, :city, :delivery_type, presence: true
  validates :price, numericality: { only_integer: true }, inclusion: { in: 1..100000 }
  validates :title, length: { maximum: 120 }
end
