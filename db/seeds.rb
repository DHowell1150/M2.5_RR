# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Athlete.destroy_all
Gym.destroy_all
@slccf = Gym.create!(name: "Salt Lake City Crossfit", num_bikes: 16, outdoor_space: false)
@alpine = Gym.create!(name: "Alpine Crossfit", num_bikes: 23, outdoor_space: true)
@v23 = Gym.create!(name: "V23 Athletics", num_bikes: 15, outdoor_space: false)


@corinna = @slccf.athletes.create!(name: "Corinna", age: 26, collegiate_athlete: false)
@nick = @slccf.athletes.create!(name: "Nick", age: 19, collegiate_athlete: true)
@jamie = @slccf.athletes.create!(name: "Jamie", age: 47, collegiate_athlete: true)
@annie = @alpine.athletes.create!(name: "Annie", age: 32, collegiate_athlete: true)
@megan = @alpine.athletes.create!(name: "Megan", age: 36, collegiate_athlete: false)
@beau = @alpine.athletes.create!(name: "Beau", age: 41, collegiate_athlete: true)
@ruthie = @alpine.athletes.create!(name: "Ruthie", age: 38, collegiate_athlete: false)
@liz = @alpine.athletes.create!(name: "Liz", age: 42, collegiate_athlete: false)