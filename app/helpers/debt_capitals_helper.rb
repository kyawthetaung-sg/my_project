module DebtCapitalsHelper
    def debt_capital
        DebtCapital.where(created_by: current_user.id).sum("amount")
    end

    def debt_capital_with_category(category)
        DebtCapital.where(created_by: current_user.id, category: category).sum("amount")
    end
end
