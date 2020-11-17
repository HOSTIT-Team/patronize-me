class Review < ApplicationRecord
  belongs_to :booking
  has_one :review

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, :booking, presence: true
end
