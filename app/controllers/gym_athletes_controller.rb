class GymAthletesController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @athletes = @gym.athletes.alph_sorted
  end

  def edit
    @gym = Gym.find(params[:id])

    @athlete = Gym.athletes.find(params[:id])
  end

  def new
  end

  def create
    @gym = Gym.find(params[:id])
    @new_gym_athlete = @gym.athletes.create!(new_gym_athlete_params)
    redirect_to "gyms/id"
  end

  def new_gym_athlete_params
    params.permit(:name, :age, :collegiate_athlete)  
  end
end
