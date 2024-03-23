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
    end 
  end
end