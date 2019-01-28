class CreatePurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_entries do |t|
      t.string :product_name
      t.integer :product_qty
      t.string :status
      t.belongs_to :purchase_order, index: true
      t.timestamps
    end
  end
end
