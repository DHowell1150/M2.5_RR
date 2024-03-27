require 'rails_helper'

RSpec.describe 'gym_athletes index page', type: :feature do
  describe ' US 5' do
    describe ' as a visitor when I visit /gym/gym_id/athletes' do
      before(:each) do
        @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)
        @alpine = Gym.create!(name: "Alpine Crossfit", num_bikes: 23, outdoor_space: true)

        @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
        @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
        @jamie = @slccf.athletes.create!(name: "Jamie", age: 47, collegiate_athlete: true)


        @annie = @alpine.athletes.create!(name: "Annie", age: 32, collegiate_athlete: true)
        @megan = @alpine.athletes.create!(name: "Megan", age: 36, collegiate_athlete: false)
      end

      #US 5 
      it 'displays gyms athletes and thier attributes' do
        # When I visit '/parents/:parent_id/child_table_name'
        visit "/gyms/#{@alpine.id}/athletes"
        # visit gym_athletes_path(gym_id: @alpine.id)
        # Then I see each Child that is associated with that Parent with each Child's attributes
        within "#athlete-#{@annie.id}" do
          expect(page).to have_content(@annie.name)
          expect(page).to have_content(@annie.age)
          expect(page).to have_content(@annie.collegiate_athlete?)
        end

        within "#athlete-#{@megan.id}" do
          expect(page).to have_content(@megan.name)
          expect(page).to have_content(@megan.age)
          expect(page).to have_content(@megan.collegiate_athlete?)
        end
      end

      # US13 Parent Child Creation
      it 'has link to add a new athlete' do
        visit "/gyms/#{@slccf.id}/athletes"
        expect(page).to have_link("Add Athlete")

        click_link "Add Athlete"

        expect(current_path).to eq("/gyms/#{@slccf.id}/athletes/new")
      end
      
      it "has form to create new athlete" do
        visit "/gyms/#{@slccf.id}/athletes/new"
        fill_in :name, with: "Jamie Dodge"
        fill_in :age, with: "50"
        # fill_in :collegiate_athlete, with: "false"

        click_on "Add Athlete"

        new_gym_athlete = @slccf.athletes.last
        expect(current_path).to eq("/gyms/:id/athletes")
        expect(page).to have_content("Jamie Dodge")
      end

      #US18, Child Update From Childs Index Page 
      it "has link next to each athlete to update" do
        visit "/gyms/#{@slccf.id}/athletes"
        within "#athlete-#{@corinna.id}" do
        expect(page).to have_link("Update #{@corinna.name}")
        click_link "Update #{@corinna.name}"
        expect(current_path).to eq("/gyms/:gym_id/athletes/#{@corinna.id}/edit")
        end
          visit "/gyms/#{@slccf.id}/athletes"

        within "#athlete-#{@nick.id}" do
          expect(page).to have_link("Update #{@nick.name}")
          click_link  "Update #{@nick.name}"
          expect(current_path).to eq("/gyms/:gym_id/athletes/#{@nick.id}/edit")
        end
          visit "/gyms/#{@slccf.id}/athletes"

        within "#athlete-#{@jamie.id}" do
          expect(page).to have_link("Update #{@jamie.name}")
          click_link  "Update #{@jamie.name}"
          expect(current_path).to eq("/gyms/:gym_id/athletes/#{@jamie.id}/edit")
        end
          visit "/gyms/#{@slccf.id}/athletes"

        # Next to every child, I see a link to edit that child's info
        # When I click the link
        # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
      end
    end 
  end
end