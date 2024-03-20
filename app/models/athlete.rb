class Athlete < ApplicationRecord
  belongs_to :gym

  def collegiate_athlete?
    if collegiate_athlete
      "Collegiate Athlete"
    else
      "No College Athletics"
    end
  end
end
