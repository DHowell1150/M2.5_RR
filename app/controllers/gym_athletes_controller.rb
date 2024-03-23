class GymAthletesController < ApplicationController
  def index
    @gym = Gym.find(params[:id])
    @athletes = @gym.athletes
  end
end
