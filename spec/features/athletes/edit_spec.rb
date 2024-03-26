require 'rails_helper'

RSpec.describe 'Gym Edit page', type: :feature do
  describe ' USER STORY #12 and 17b' do
    describe ' as a visitor when I visit /gyms/:id/edit' do
      before(:each) do
        @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

        @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
        @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
      end

      it "has form to update gym" do
        visit ("/athletes/#{@corinna.id}/edit")
        # When I fill out the form with updated information
        fill_in :name, with: "Corinna Coffin"
        fill_in :age, with: 25
        choose("collegiate_athlete_false")
        
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
end


# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

