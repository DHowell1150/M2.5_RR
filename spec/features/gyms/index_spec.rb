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

    # US 11 Gym creation
    it 'links to the new page from gym index' do
      visit "/gyms"
      expect(page).to have_link("New Gym")
      click_link "New Gym"
      expect(current_path).to eq("/gyms/new")
    end

    it 'has form for new gym ' do
      visit "/gyms/new"
  
      fill_in :name, with: "Applewood Crossfit"
      fill_in "bikes", with: "6"
      choose("outdoor_space_false")

      click_on "Create Gym"
   
      new_gym = Gym.last
      
      expect(current_path).to eq("/gyms")
      expect(new_gym.name).to eq("Applewood Crossfit")
      expect(page).to have_content("#{new_gym.name}")
      # expect(page).to have_content("#{new_gym.outdoor_space?}")
    end

    # US17 update link
    it 'has a link next to each gym' do
      visit ("/gyms")

      # Next to every parent, I see a link to edit that parent's info
      expect(page).to have_link("Update Gym")

      # When I click the link
      click_link "Update Gym"

      # I should be taken to that parent's edit page where I can update its information just like in User Story 12
      expect(current_path).to eq("/gyms/#{@sclccf.id}/edit")
    end
  end
end


