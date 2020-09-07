json.extract! general_expense, :id, :date, :category_id, :amount, :note, :created_at, :updated_at
json.url general_expense_url(general_expense, format: :json)
