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
    redirect_to "/gardens/#{garde.id}/plants"
  end

  def edit
    @garden = Garden.find(params[:id])
  end
  
  def update
    garden = Garden.find(params[:id])
    garden.update(garden_params)
    garden.save
    redirect_to "/gardens/#{garden.id}"
  end

  def destroy
    garden = Garden.find(params[:id])
    garden.plants.destroy_all
    garden.save
    redirect_to "/gardens"
  end
  
  private
  
  def garden_params
    # require 'pry'; binding.pry

    params.permit(:name, :location, :plantable, :plot)
  end
  



end