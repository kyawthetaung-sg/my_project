json.extract! income, :id, :date, :amount, :expense_category_id, :payment_mode_id, :note, :created_at, :updated_at
json.url income_url(income, format: :json)
