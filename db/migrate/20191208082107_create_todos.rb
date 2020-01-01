class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.integer :household_id
      t.text :title, null: false
      t.string :body
      t.boolean:finished,default:false
      t.date :term, null: false
      t.time :starttime
      t.time :finishtime

      t.timestamps
    end
  end
end
