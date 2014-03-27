class AddImgurlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :imgurl, :text
  end
end
