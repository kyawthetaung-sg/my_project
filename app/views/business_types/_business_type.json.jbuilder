json.extract! business_type, :id, :name, :purchase_price, :sale_price, :quantity, :category_id, :created_at, :updated_at
json.url business_type_url(business_type, format: :json)
