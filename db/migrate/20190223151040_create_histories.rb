class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.datetime :date_action
      t.datetime :log_in_timestamp
      t.datetime :log_out_timestamp

      t.timestamps
    end
  end
end
