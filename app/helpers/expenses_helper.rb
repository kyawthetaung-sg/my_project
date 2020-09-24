module ExpensesHelper
    def expense_amount
        Expense.where(created_by: current_user.id).sum(:amount)
    end

    def expense_amount_with_day(day)
        year = Date.current.year
        month = Date.current.month
        begin
            date = DateTime.parse("#{year}/#{month}/#{day}")
            Expense.where(created_by: current_user.id, date: date..date.end_of_day).sum(:amount)
        rescue ArgumentError
            0
        end
    end

    def expense_amount_with_month(month, year)
        year = year == nil ? Date.current.year : year
        date = DateTime.parse("#{year}/#{month}/01")
        Expense.where(created_by: current_user.id, date: date..date.end_of_month).sum(:amount)
    end
end
