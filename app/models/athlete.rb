class Athlete < ApplicationRecord
  belongs_to :gym

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
end
