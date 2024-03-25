class Gym < ApplicationRecord
  belongs_to :gym
  belongs_to :athlete

  def athletes_alph_sorted
    require 'pry' ; binding.pry
  end
end