class ProductsAndPurchaseOrdersRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :products_purchase_orders, id: false do |t|
      t.belongs_to :products, index: true
      t.belongs_to :purchase_orders, index: true
    end
  end
end
