# require 'rails_helper'

# RSpec.describe 'Gym ', type: :feature do
#   describe ' US 11 Gym creation' do
#     describe ' as a visitor when I visit /gym' do
#       it 'links to the new page from gym index' do
#         visit "/gyms"
#         expect(page).to have_link("New Gym")
#         # When I click this link
#         click_link "New Gym"
#         # Then I am taken to '/parents/new' where I  see a form for a new parent record
#         expect(current_path).to eq("/gyms/new")
#       end

#       it 'creates form for new gym ' do
#         expect(current_path).to eq("/gyms/new")

#         # When I fill out the form with a new parent's attributes:
#         fill_in "New Gym", with: "Applewood Crossfit"
    
#         # And I click the button "Create Parent" to submit the form
#         click_on "Create Gym"
        
#         # Then a `POST` request is sent to the '/parents' route,
#         # a new parent record is created,
#         new_gym = Gym.last
        
#         # and I am redirected to the Parent Index page where I see the new Parent displayed.
#         expect(current_path).to eq("/gyms")
#         expect(page).to have_content("#{new_gym.name}")
#         expect(page).to have_content("#{new_gym.bikes}")
#         expect(page).to have_content("#{new_gym.outdoor_space?}")
#       end
#     end 
#   end
# end