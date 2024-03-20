require 'rails_helper'

RSpec.describe 'Gym Show page', type: :feature do
  describe 'Gym show page' do
    before(:each) do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)
    end

    it 'displays gym name and attributes' do
      visit "/gyms/#{@slccf.id}"

      expect(page).to have_content(@slccf.name)
      expect(page).to have_content(@slccf.num_bikes)
      expect(page).to have_content("Does Not Have Outdoor Space")
      expect(page).not_to have_content("Has Outdoor Space")
    end
  end
end