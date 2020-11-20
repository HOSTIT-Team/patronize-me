class BookingsController < ApplicationController

  before_action :find_booking, only: [:show, :destroy, :accept, :reject, :edit, :update]

  skip_before_action :authenticate_user!, only: :index

  def index
    @bookings_requests = policy_scope(Booking.where(user: current_user))
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

  def accept
    authorize @booking
    @booking.status = 'Accepted'
    @booking.save
    redirect_to bookings_path
  end

  def reject
    authorize @booking
    @booking.status = 'Declined'
    @booking.save
    redirect_to bookings_path
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path(@offer)
      flash.alert = "Request to change booking successfully submitted."
    else
      render :edit
      flash.alert = "Request to change booking not submitted. Please check inputs."
    end

  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :day, :comment)
  end
end
