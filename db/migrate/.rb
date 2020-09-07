class AddEmailToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :email, :string
    add_column :blogs, :url, :string
  end
end
