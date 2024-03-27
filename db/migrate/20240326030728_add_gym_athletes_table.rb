class AddGymAthletesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :gym_athletes do |t|
      t.references :gym, foreign_key: true
      t.references :athlete, foreign_key: true

      t.timestamps
    end
  end
end
