class CreatePurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_entries do |t|
      t.string :product_name
      t.integer :product_qty
      t.string :status

      t.timestamps
    end
  end
end
