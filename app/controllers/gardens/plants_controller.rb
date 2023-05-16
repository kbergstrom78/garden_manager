class Gardens::PlantsController < ApplicationController
  def index
    @garden = Garden.find(params[:garden_id])
    @plants = @garden.plants

    if params[:sort] == 'name'
      @plants = @plants.order(name: :asc)
    end
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


  def only_return_records_with_more_than_8_of_plant_quantity
    @garden = Garden.find(params[:id])
    number = params[:number].to_i
    @plants = @garden.plants.where("#{Quantity} > ?", number)
    redirect_to "/gardens#{@garden.id}/plants"
  end

  private

  def plant_params
    params.permit(:name, :plant_type, :water, :light, :poisonous, :zone)
  end


end