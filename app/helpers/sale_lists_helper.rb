module SaleListsHelper
    def business_type_total_price(sale_list_id)
        @sale_products = SaleListBusinessType.where(sale_list_id: sale_list_id, created_by: current_user.id).sum(:sale_price)
    end

    def business_type_name(sale_list_id)
        @sale_products = SaleListBusinessType.where(sale_list_id: sale_list_id, created_by: current_user.id).select(:business_type_id).distinct
        @name = ""
        @sale_products.each do |sale_product|
            @business_type = BusinessType.find(sale_product[:business_type_id])
            @sale_products_count = SaleListBusinessType.where(sale_list_id: sale_list_id, business_type_id: sale_product[:business_type_id]).count

            if sale_product.equal?(@sale_products.last)
                @name+= @business_type.name + " (#{@sale_products_count})"
            else
                @name+= @business_type.name + " (#{@sale_products_count})" + ", "
            end
        end
        return @name
    end
end
