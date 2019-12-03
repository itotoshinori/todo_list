class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :body
      t.integer :blog_id

      t.timestamps
    end
  end
end
