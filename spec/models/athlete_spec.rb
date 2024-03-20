require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe "relations" do
    it { should belong_to :gym}
  end

  describe "instance methods" do
    it "#collegiage_athlete?" do
    @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

    @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
    @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)

    expect(@corinna.collegiate_athlete?).to eq("No College Athletics")
    expect(@nick.collegiate_athlete?).to eq("Collegiate Athlete")
    end
  end
end
