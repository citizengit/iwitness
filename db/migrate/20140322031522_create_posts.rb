class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.text :image
      t.integer :rating_up
      t.integer :rating_down
      t.integer :user_id
      t.text :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
