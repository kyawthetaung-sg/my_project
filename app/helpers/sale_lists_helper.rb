module SaleListsHelper
    def business_type_total_price(sale_list_id)
        @sale_products = SaleListBusinessType.where(sale_list_id: sale_list_id, created_by: current_user.id).sum(:sale_price)
    end

    def business_type_name(sale_list_id)
        @sale_products = SaleListBusinessType.where(sale_list_id: sale_list_id, created_by: current_user.id)
        @name = ""
        @sale_products.each do |sale_product|
            @business_type = BusinessType.find(sale_product[:business_type_id])
            @name+= @business_type.name + ","
        end
        return @name
    end
end
