require 'rails_helper'

RSpec.describe 'Athlete Index Page', type: :feature do
  describe 'Athlete Index Page' do
    before(:each) do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

      @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
    end

    #US3
    it 'displays athlete name, age, collegiate_athlete status.' do
      visit "/athletes"

      within "#athlete-#{@corinna.id}" do
        expect(page).to have_content(@corinna.name)
        expect(page).to have_content(@corinna.age)
        expect(page).to have_content("No College Athletics")
      end

      within "#athlete-#{@nick.id}" do
        expect(page).to have_content(@nick.name)
        expect(page).to have_content(@nick.age)
        expect(page).to have_content("Collegiate Athlete")
      end
    end
  end
end