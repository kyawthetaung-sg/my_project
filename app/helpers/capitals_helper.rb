module CapitalsHelper
    def initial_capital
        Capital.where(created_by: current_user.id).sum(:amount)
    end

    def initial_capital_with_category(category)
        BusinessType.where(created_by: current_user.id, category: category).sum("quantity * purchase_price")
    end

    def using_capital
        BusinessType.where(created_by: current_user.id).sum("quantity * purchase_price") - sould_out_capital
    end

    def using_capital_with_category(category)
        BusinessType.where(created_by: current_user.id, category: category).sum("quantity * purchase_price") - sould_out_capital_with_category(category)
    end
    
    def sould_out_capital
        SaleListBusinessType.where(created_by: current_user.id).joins(:business_type).sum(:purchase_price)
    end
    
    def sould_out_capital_with_category(category)
        SaleListBusinessType.where(created_by: current_user.id).joins(:business_type).where(business_types: {category: category}).sum(:purchase_price)
    end
end
