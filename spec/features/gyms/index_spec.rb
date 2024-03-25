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
  end
end


# Gym has it's own outdoor space: 
# # <%= form.label :outdoor_space, "yes" %>
# # <%= form.radio_button :outdoor_space, "true" %>  Goes to params
# # <%= form.label :outdoor_space, "no" %>
# # <%= form.radio_button :outdoor_space, "false" %>

