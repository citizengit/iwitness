class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.text :image
      t.text :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
