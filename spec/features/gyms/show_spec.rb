require 'rails_helper'

RSpec.describe 'Gym Show page', type: :feature do
  describe 'Gym show page' do
    before(:each) do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

      @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
    end

    it 'displays gym name and attributes' do
      visit "/gyms/#{@slccf.id}"

      expect(page).to have_content(@slccf.name)
      expect(page).to have_content(@slccf.num_bikes)
      expect(page).to have_content("Does Not Have Outdoor Space")
      expect(page).not_to have_content("Has Outdoor Space")
    end
    
    # US7
    it 'displays count of number of gyms children' do
      # When I visit a parent's show page
      visit "/gyms/#{@slccf.id}"

      # I see a count of the number of children associated with this parent
      expect(page).to have_content("Number of Athletes: #{@slccf.athlete_count}")
    end

    # US 10
    it 'displays link to go to athletes page' do
      visit "/gyms/#{@slccf.id}"

      expect(page).to have_link("Athletes")   
      click_link "Athletes"
      expect(current_path).to eq("/gyms/#{@slccf.id}/gym_athletes")
    end

    
    it 'displays link to update gym' do
      visit "/gyms/#{@slccf.id}"

      expect(page).to have_link("Update Gym")
      click_on "Update Gym"
      
      expect(current_path).to eq("/gyms/#{@slccf.id}/edit")
    end

    it "has form to update gym" do
      visit ("/gyms/#{@slccf.id}/edit")
      # When I fill out the form with updated information
      fill_in :name, with: "Salt Lake City Athletics"
      fill_in :num_bikes, with: "16"
      fill_in :outdoor_space, with: "Does Not Have Outdoor Space"
      # And I click the button to submit the form
      click_on "Update"
      # Then a `PATCH` request is sent to '/parents/:id',
      # the parent's info is updated,
      # and I am redirected to the Parent's Show page where I see the parent's updated info
      expect(current_path).to eq("/gym/#{@slccf.id}/edit")
      expect(page).to have_content("Salt Lake City Athletics")
    end
  end
end