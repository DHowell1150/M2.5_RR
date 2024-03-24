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


    # US6 
    it "sorts gyms by Most Recently Created" do
      visit "/gyms"
      expect(@v23.name).to appear_before(@alpine.name)
      expect(@alpine.name).to appear_before(@slccf.name)
    end

    it 'links to the new page from gym index' do
      visit "/gyms"
      expect(page).to have_link("New Gym")
      # When I click this link
      click_link "New Gym"
      # Then I am taken to '/parents/new' where I  see a form for a new parent record
      expect(current_path).to eq("/gyms/new")
    end

    it 'creates form for new gym ' do
      visit "/gyms/new"
      # expect(current_path).to eq("/gyms/new")
      # When I fill out the form with a new parent's attributes:
      fill_in :name, with: "Applewood Crossfit"
      fill_in "bikes", with: "6"
      fill_in "outdoor_space", with: "false"
  
      # And I click the button "Create Parent" to submit the form
      click_on "Create Gym"
      
      # Then a `POST` request is sent to the '/parents' route,
      # a new parent record is created,
      new_gym = Gym.last
      
      # and I am redirected to the Parent Index page where I see the new Parent displayed.
      expect(current_path).to eq("/gyms")
      expect(page).to have_content("#{new_gym.name}")
      # expect(page).to have_content("#{new_gym.outdoor_space?}")
    end
  end
end