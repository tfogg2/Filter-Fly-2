json.extract! product_type, :id, :category_id, :title, :handle, :created_at, :updated_at
json.url product_type_url(product_type, format: :json)