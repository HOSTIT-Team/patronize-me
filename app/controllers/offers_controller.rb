class OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @offers = policy_scope(Offer)
    @offer = Offer.new

    if params[:category].present?
      @offers = Offer.where(category: params[:category])
    else
      @offers
    end

    if params[:location].present?
      @offers = Offer.where(city: params[:location])
    else
      @offers
    end
  end

  def show
    authorize @offer
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :show
      # flash.alert = "Booking request not created. Please check inputs."
    end
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
      flash.alert = "Offer successfully created."
    else
      render :new
      flash.alert = "Offer not created. Please check inputs."
    end
  end

  def edit
    authorize @offer
  end

  def update
    authorize @offer
    @offer.update(offer_params)
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
      flash.alert = "Offer successfully updated."
    else
      render :edit
      flash.alert = "Offer not updated. Please check inputs."
    end
  end

  def destroy
    authorize @offer
    if @offer.destroy
      redirect_to offers_path
      flash.alert = "Offer successfully deleted."
    else
      flash.alert = "Offer not deleted"
    end
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :category, :price, :description, :city, :delivery_type, :banner)
  end

  def booking_params
    params.permit(:status, :day, :comment)
  end
end
