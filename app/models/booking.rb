class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :day, presence: true
  validates :comment, length: { maximum: 500 }

  geocoded_by :patron_address
  after_validation :geocode, if: :will_save_change_to_patron_address?
end
