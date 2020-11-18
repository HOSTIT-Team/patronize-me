class BookingsController < ApplicationController
  def index
     @bookings_requests = policy_scope(Booking)
    # @bookings_as_artist = Booking.where(offer.user == current_user)
  end
end
