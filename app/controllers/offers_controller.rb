class OffersController < ApplicationController
  before_action :find_offer, only: [:show]

  def index
    @offers = Offer.all
  end

  def show
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
