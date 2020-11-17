class Review < ApplicationRecord
  belongs_to :booking
  has_one :review

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :content, presence: true
end
