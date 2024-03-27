class ChangeLocationToBeNameInGym < ActiveRecord::Migration[7.1]
  def change
    rename_column :gyms, :location, :name
  end
end
