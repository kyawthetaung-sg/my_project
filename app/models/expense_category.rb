class ExpenseCategory < ApplicationRecord
    validates :name, presence: true

    has_many :incomes
    has_many :expenses
end
