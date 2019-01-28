class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.datetime :date_order
      t.string :status

      t.timestamps
    end
  end
end
