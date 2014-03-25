class CreatePostvotesUservotes < ActiveRecord::Migration
  def change
    create_table :postvotes_uservotes, :id => false do |t|
      t.integer :post_id
      t.integer :user_id
    end
  end
end
