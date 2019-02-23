class DeleteBrandFromPurchaseEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :purchase_entries do |t|
      t.remove :brand
    end
  end
end
