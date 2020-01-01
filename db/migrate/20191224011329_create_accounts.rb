class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :item
      t.integer :todo_id
      t.integer :amount
      t.date :registrationdate
      t.string :remark

      t.timestamps
    end
  end
end
