require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe "relations" do
    it { should belong_to :gym}
    # it { should have_many :gym_athletes}
  end

  describe "instance methods" do
    it "#collegiage_athlete?" do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

      @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)

      expect(@corinna.collegiate_athlete?).to eq("No College Athletics")
      expect(@nick.collegiate_athlete?).to eq("Collegiate Athlete")
    end

    it '#alpha_sorted' do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

      @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
      @jamie = @slccf.athletes.create!(name: "Jamie", age: 47, collegiate_athlete: true)

      expect(@slccf.athletes.alph_sorted).to eq([@corinna, @jamie, @nick])
    end
  end

  describe "Class methods" do
    it '#college_athlete' do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

      @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)

      expect(Athlete.college_athlete).to eq([@nick])
      expect(Athlete.college_athlete).not_to eq([@corinna])
    end
  end
end
