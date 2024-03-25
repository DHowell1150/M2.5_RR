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
    @new_gym = Gym.create!(new_gym_params)
    redirect_to"/gyms"
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def new_gym_params
    params.permit(:name, :num_bikes, :outdoor_space)
  end
end
