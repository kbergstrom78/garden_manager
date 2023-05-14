class GardensController < ApplicationController
  def index
    @gardens = Garden.order_by_date
  end

  def show
    @garden = Garden.find(params[:id])
  end
end