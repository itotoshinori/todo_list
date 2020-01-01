class AddToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :expense, :boolean, default: false, null: false
  end
end
