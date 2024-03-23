require 'rails_helper'

RSpec.describe 'gym_athletes index page', type: :feature do
  describe ' US 5' do
    describe ' as a visitor when I visit /gym/gym_id/athletes' do
      before(:each) do
        @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)
        @alpine = Gym.create!(name: "Alpine Crossfit", num_bikes: 23, outdoor_space: true)

        @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
        @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
        @annie = @alpine.athletes.create!(name: "Annie", age: 32, collegiate_athlete: true)
        @megan = @alpine.athletes.create!(name: "Megan", age: 36, collegiate_athlete: false)
      end

      #US 5 
      it 'displays' do
        # When I visit '/parents/:parent_id/child_table_name'
        visit "/gyms/#{@alpine.id}/gym_athletes"
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
    end 
  end
end