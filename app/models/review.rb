class Review < ApplicationRecord
  belongs_to :booking
  has_one :review
end
