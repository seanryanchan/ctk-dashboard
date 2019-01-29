class RemoveBackloggedFromProducts < ActiveRecord::Migration[5.2]
  def change
    change_table :products do |t|
      t.remove :backlogged;
      t.float :unit_price;
    end
  end
end
