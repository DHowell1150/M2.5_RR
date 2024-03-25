class AthletesController < ApplicationController
  def index 
    @athletes = Athlete.college_athlete
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update

  end
end
