class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :product_type
      t.integer :quantity
      t.boolean :backlogged

      t.timestamps
    end
  end
end
