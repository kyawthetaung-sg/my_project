module ProductSalesHelper
    def business_type_with_category(category)
        @business_types = BusinessType.where(created_by: current_user.id, category: category)
    end
end
