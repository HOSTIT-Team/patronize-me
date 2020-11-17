class OffersController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def index
    @offers = Offer.all
  end

  def show
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
