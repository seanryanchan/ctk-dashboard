class AddBrandToEntries < ActiveRecord::Migration[5.2]
  def change
    change_table :purchase_entries do |t|
      t.string :brand
    end
  end
end
