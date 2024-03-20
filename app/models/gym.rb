class Gym < ApplicationRecord
  has_many :athletes

  def outdoor_space_method
    if outdoor_space
      "Has Outdoor Space"
    else
      "Does Not Have Outdoor Space"
    end
  end
end
