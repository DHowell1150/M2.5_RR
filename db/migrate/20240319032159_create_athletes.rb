class CreateAthletes < ActiveRecord::Migration[7.1]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :age
      t.boolean :collegiate_athlete
      t.references :gym, null: false, foreign_key: true

      t.timestamps
    end
  end
end
