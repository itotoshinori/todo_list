class AddToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :account_id, :integer
  end
end
