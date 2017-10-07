class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    user = User.find_by(id: session[:user_id])
    redirect_to user_path(user)
  end

  private

  def ride_params
    params.require(:ride).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
