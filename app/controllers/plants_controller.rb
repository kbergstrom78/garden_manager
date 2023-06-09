class PlantsController < ApplicationController

  def index
    @plants = Plant.where(poisonous: true)
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    plant = Plant.find(params[:id])
    plant.update(plant_params)
    plant.save
    redirect_to "/plants/#{plant.id}"
  end

  def destroy
    plant = Plant.find(params[:id])
    plant.destroy
    plant.save
    redirect_to "/plants"
  end

  private
    
  def plant_params
    params.permit(:name, :plant_type, :water, :light, :poisonous, :zone)
  end
end