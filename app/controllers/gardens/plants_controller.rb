class Gardens::PlantsController < ApplicationController
  def index
    @garden = Garden.find(params[:garden_id])
    @plants = @garden.plants
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @garden.plants.create!(plant_params)
    redirect_to "/gardens/#{@garden.id}/plants"
  end

  private

  def plant_params
    params.permit(:name, :plant_type, :water, :light, :poisonous, :zone)
  end
end