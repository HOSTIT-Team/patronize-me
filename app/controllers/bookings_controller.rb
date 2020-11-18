class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]
  # skip_before_action :authenticate_user!, only: :index

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new
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
