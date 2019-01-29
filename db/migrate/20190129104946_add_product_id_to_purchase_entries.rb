class AddProductIdToPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :purchase_entries do |t|
      t.integer :product_id;
      t.remove :status;
      t.integer :status;
    end
  end
end
