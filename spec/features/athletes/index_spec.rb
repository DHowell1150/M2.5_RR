require 'rails_helper'

RSpec.describe 'Athlete Index Page', type: :feature do
  describe 'Athlete Index Page' do
    before(:each) do
      @slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)

      @corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
      @nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
      @jamie = @slccf.athletes.create!(name: "Jamie", age: 47, collegiate_athlete: true)

    end

    #US3
    # it 'displays athlete name, age, collegiate_athlete status.' do
    #   visit "/athletes"
    #   within "#athlete-#{@corinna.id}" do
    #     expect(page).to have_content(@corinna.name)
    #     expect(page).to have_content(@corinna.age)
    #     expect(page).to have_content("No College Athletics")
    #   end

    #   within "#athlete-#{@nick.id}" do
    #     expect(page).to have_content(@nick.name)
    #     expect(page).to have_content(@nick.age)
    #     expect(page).to have_content("Collegiate Athlete")
    #   end
    # end

  #  US15 Display only collegiate athletes
    it 'displays only athletes who were collegiate athletes' do
      visit "/athletes"

      expect(page).to have_content(@nick.name)
      expect(page).not_to have_content(@corinna.name)
    end
    
    # US 18, Child Update From Childs Index Page 
    it "displays link next to each athlete to update athlete" do
      visit "/athletes"

      # Next to every child, I see a link to edit that child's info
      within "#athlete-#{@corinna.id}" do
        expect(page).to have_link("Update #{@corinna.name}")
        click_link "Update #{@corinna.name}"
        expect(current_path).to eq("/athletes/#{@corinna}/edit")
      end
      visit "/athletes"


      # Next to every child, I see a link to edit that child's info
      within "#athlete-#{@nick.id}" do
        expect(page).to have_link("Update #{@nick.name}")
        click_link "Update #{@nick.name}"
        expect(current_path).to eq("/athletes/#{@nick.name}/edit")
      end
      visit "/athletes"


      within "#athlete-#{@jamie.id}" do
        expect(page).to have_link("Update #{@jamie.name}")
        click_link "Update #{@jamie.name}"
        expect(current_path).to eq("/athletes/#{@jamie.name}/edit")
      end
      visit "/athletes"

      # Next to every child, I see a link to edit that child's info
      # When I click the link
      # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
    end
  end
end