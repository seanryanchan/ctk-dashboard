json.extract! purchase_entry, :id, :product_name, :product_qty, :status, :created_at, :updated_at
json.url purchase_entry_url(purchase_entry, format: :json)
