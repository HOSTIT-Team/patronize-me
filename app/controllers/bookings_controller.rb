class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]
  skip_before_action :authenticate_user!, only: :index

 def index
     @bookings_requests = policy_scope(Booking)
   @artist = current_user.offers.any?
    @bookings = current_user.bookings
    if @artist
      @my_offers = current_user.offers
      @bookings_as_artist = Booking.where(offer_id: @my_offers.pluck(:id))
    end

end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "offers/show"
      flash.alert = "Booking request not created. Please check inputs."
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :day, :comment)
  end
end
