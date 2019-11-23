class CreatePortals < ActiveRecord::Migration[5.1]
  def change
    create_table :portals do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
