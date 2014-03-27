class DropPostvotesUservotes < ActiveRecord::Migration
  def change
    drop_table :postvotes_uservotes
  end
end
