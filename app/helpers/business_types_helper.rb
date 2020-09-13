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
        SaleList.where(created_by: current_user.id).sum(:first_payment)
    end

    def sold_out_price_cash_with_category(category)
        first_payment_results = SaleListBusinessType.where(created_by: current_user.id).joins(:business_type).where(business_types: {category: category}).joins(:sale_list).distinct.pluck(:sale_list_id, :first_payment)
        result = 0
        first_payment_results.each do |r|
            result += r[1]
        end
        result
    end
end
