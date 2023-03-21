json.extract! carted_product, :id, :created_at, :updated_at
json.url carted_product_url(carted_product, format: :json)
