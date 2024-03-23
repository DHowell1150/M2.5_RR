class GymsController < ApplicationController
  def index 
    @gyms = Gym.all
  end
  
  def show
    @gym = Gym.find(params[:id])
  end

  def new
  end
  
  def create
    new_gym = Gym.create!(name: params[:name], num_bikes: params[:num_bikes], outdoor_space: params[:outdoor_space])
    redirect_to"/gyms"
  end
end
