class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
  end

  def contact
  end

  def index
    @offers = policy_scope(Offer)
    @offer = Offer.new
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :category, :price, :description, :city, :delivery_type, :banner)
  end
end
