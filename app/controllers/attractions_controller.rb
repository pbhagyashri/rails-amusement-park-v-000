class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])

    @attraction.name = params[:attraction][:name]
    @attraction.min_height = params[:attraction][:min_height]
    @attraction.happiness_rating = params[:attraction][:happiness_rating]
    @attraction.nausea_rating = params[:attraction][:nausea_rating]
    @attraction.tickets = params[:attraction][:tickets]
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
