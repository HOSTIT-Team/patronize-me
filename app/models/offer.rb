class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  # add variable for delivery_type

  validates :title, :category, :price, :city, :delivery_type, presence: true
  validates :price, numericality: { only_integer: true }, inclusion: { in: 1..100000 }
  validates :title, length: { maximum: 100 }
  validates :delivery_type, inclusion: { in: ["deadline", "day"]}
end
