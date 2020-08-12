json.extract! account, :id, :user_name, :first_name, :last_name, :email, :password, :password_confirmation, :role_id, :theme_id, :created_at, :updated_at
json.url account_url(account, format: :json)
