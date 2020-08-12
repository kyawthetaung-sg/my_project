class Account < User
    validates :user_name, uniqueness: true, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :role_id, presence: true
    validates :theme_id, presence: true
end
