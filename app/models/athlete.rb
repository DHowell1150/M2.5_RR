class Athlete < ApplicationRecord
  belongs_to :gym
  # has_many :gym_athletes, dependent: :destroy

  def collegiate_athlete?
    if collegiate_athlete
      "Collegiate Athlete"
    else
      "No College Athletics"
    end
  end

  def self.college_athlete
    Athlete.where("collegiate_athlete = true")
  end

  def self.alph_sorted
    Athlete.order(:name)
  end
end
