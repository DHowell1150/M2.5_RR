class Change < ActiveRecord::Migration[7.1]
  def change
    change_column :gyms, :location, :name
  end
end
