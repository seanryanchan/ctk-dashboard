json.extract! product, :id, :brand, :product_type, :quantity, :backlogged, :created_at, :updated_at
json.url product_url(product, format: :json)
