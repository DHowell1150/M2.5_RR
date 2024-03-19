class CreateGyms < ActiveRecord::Migration[7.1]
  def change
    create_table :gyms do |t|
      t.string :location
      t.integer :num_bikes
      t.boolean :outdoor_space

      t.timestamps
    end
  end
end
