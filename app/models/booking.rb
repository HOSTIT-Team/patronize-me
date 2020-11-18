class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  # validates :day, presence: true
  # validates :comment, length: { maximum: 500 }
end
