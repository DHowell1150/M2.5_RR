class AthletesController < ApplicationController
  def index 
    @athletes = Athlete.all
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
