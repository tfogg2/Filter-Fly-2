json.extract! product, :id, :product_type_id, :category_id, :shopify_product_id, :created_at, :updated_at
json.url product_url(product, format: :json)