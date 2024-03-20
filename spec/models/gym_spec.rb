require 'rails_helper'

RSpec.describe Gym, type: :model do
  describe 'relations' do
    it {should have_many :athletes}
  end

  describe "instance methods" do
    before do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)
      @alpine = Gym.create!(name: "Alpine Crossfit", num_bikes: 23, outdoor_space: true)
      @v23 = Gym.create!(name: "V23 Athletics", num_bikes: 15, outdoor_space: false)
    end

    describe "#outdoor_space_method" do
      it "returns a user friendly string for boolean result" do
        expect(@slccf.outdoor_space_method).to eq("Does Not Have Outdoor Space")
        expect(@slccf.outdoor_space_method).not_to eq("Has Outdoor Space")
        expect(@alpine.outdoor_space_method).not_to eq("Does Not Have Outdoor Space")
        expect(@alpine.outdoor_space_method).to eq("Has Outdoor Space")
      end
    end
  end
end