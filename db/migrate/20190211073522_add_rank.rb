class AddRank < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.integer "rank"
    end
  end
end
