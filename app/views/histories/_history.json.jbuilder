json.extract! history, :id, :user_id, :date_action, :log_in_timestamp, :log_out_timestamp, :created_at, :updated_at
json.url history_url(history, format: :json)
