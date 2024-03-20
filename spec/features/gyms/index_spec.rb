require 'rails_helper'

RSpec.describe 'Gym Index page', type: :feature do
  describe 'gym index page' do
    before(:each) do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)
      @alpine = Gym.create!(name: "Alpine Crossfit", num_bikes: 23, outdoor_space: true)
      @v23 = Gym.create!(name: "V23 Athletics", num_bikes: 15, outdoor_space: false)
    end

    #US1
    it 'displays name of each gym' do
      visit "/gyms"

      expect(page).to have_content(@slccf.name)
      expect(page).to have_content(@alpine.name)
      expect(page).to have_content(@v23.name)
    end
  end
end