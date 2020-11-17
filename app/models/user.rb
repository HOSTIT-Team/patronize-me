class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :first_name, :last_name, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  validates :description, length: { maximum: 500 }
  validates :phone_number, numericality: { only_integer: true }
end
