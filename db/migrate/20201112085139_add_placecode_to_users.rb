class AddPlacecodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :placecode, :string
  end
end
