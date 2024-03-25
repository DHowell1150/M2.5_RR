require 'rails_helper'

RSpec.describe 'Athlete Show Page', type: :feature do
  describe ' USER STORY #4' do
    describe ' as a user when I visit /athletes/:id' do
      before(:each) do
        @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

        @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      end

      it 'displays Athlete and their data' do
        visit "/athletes/#{@corinna.id}"
        expect(page).to have_content(@corinna.name)
        expect(page).to have_content(@corinna.age)
        expect(page).to have_content("No College Athletics")
      end

      # US14
      it 'has a link to update' do
        # When I visit a Child Show page
        visit "/athletes/#{@corinna.id}"
        # Then I see a link to update that Child "Update Child"
        expect(page).to have_link("Update Athlete")
        # When I click the link
        click_link "Update Athlete"
        # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
        expect(current_path).to eq("/athletes/#{@corinna.id}/edit")
      end
      it 'Can update athlete' do
        visit "/athletes/#{@corinna.id}"
        # When I click the button to submit the form "Update Child"
        click_on "Update Athlete"
        # Then a `PATCH` request is sent to '/child_table_name/:id',
        # the child's data is updated,
        # and I am redirected to the Child Show page where I see the Child's updated information
        expect(current_path).to eq("/athletes/#{@corinna.id}/edit")
      end
    end 
  end
end