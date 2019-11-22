class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :companyname
      t.string :president
      t.string :headoffice
      t.string :tel
      t.string :description

      t.timestamps
    end
  end
end
