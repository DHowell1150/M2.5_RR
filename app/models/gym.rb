class Gym < ApplicationRecord
  has_many :athletes
  # has_many :gym_athletes

  def outdoor_space_method
    if outdoor_space
      "Has Outdoor Space"
    else
      "Does Not Have Outdoor Space"
    end
  end

  def athlete_count
    athletes.count
  end
end
