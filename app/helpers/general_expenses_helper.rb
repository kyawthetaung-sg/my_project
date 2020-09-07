module GeneralExpensesHelper
    def general_expense
        GeneralExpense.where(created_by: current_user.id).sum("amount")
    end

    def general_expense_with_category(category)
        GeneralExpense.where(created_by: current_user.id, category: category).sum("amount")
    end
end
