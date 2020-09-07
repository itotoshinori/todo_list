class AddEmailToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :email, :string
    add_column :comments, :url, :string
  end
end
