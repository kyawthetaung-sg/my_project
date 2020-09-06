module BusinessTypesHelper
    def sould_out_quantity(id)
        SaleListBusinessType.where(business_type_id: id).count
    end

    def sold_out_price
        SaleListBusinessType.where(created_by: current_user.id).sum(:sale_price)
    end

    def sold_out_price_with_category(category)
        SaleListBusinessType.where(created_by: current_user.id).joins(:business_type).where(business_types: {category: category}).sum(:sale_price)
    end

    def sold_out_price_cash
        SaleListBusinessType.where(created_by: current_user.id).joins(:sale_list).sum(:first_payment)
    end

    def sold_out_price_cash_with_category(category)
        SaleListBusinessType.where(created_by: current_user.id).joins(:business_type).where(business_types: {category: category}).joins(:sale_list).sum(:first_payment)
    end
end
