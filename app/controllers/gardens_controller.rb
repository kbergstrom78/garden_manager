class GardensController < ApplicationController
  def index
    @gardens = Garden.order_by_date
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
  end

  def create
    Garden.create!(garden_params)
    redirect_to "/gardens"
  end

  private
  
  def garden_params
    # require 'pry'; binding.pry

    params.permit(:name, :location, :plantable, :plot)
  end
  



end