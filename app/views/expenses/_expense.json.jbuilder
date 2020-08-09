json.extract! expense, :id, :date, :amount, :expense_category_id, :payment_mode_id, :note, :created_at, :updated_at
json.url expense_url(expense, format: :json)
