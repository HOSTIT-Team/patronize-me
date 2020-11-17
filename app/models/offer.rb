class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  CITY = ["Amsterdam", "Berlin", "London", "Paris"]
  GENRE = ["DJ", "Live", "Music", "Painting", "Dance", "Singing", "Acting"]
end
