class OffersController < ApplicationController
  before_action :find_offer, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @offers = policy_scope(Offer)
    @offer = Offer.new
  end

  def show
    authorize @offer
    @booking = Booking.new
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
    else
      render :new
      flash.alert = "Offer not created. Please check inputs."
    end
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :category, :price, :description, :city, :delivery_type, :banner)
  end
end
