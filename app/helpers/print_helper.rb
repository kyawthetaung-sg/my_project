module PrintHelper
    def total_qty_slip(sale_list_id, product_id)
        SaleListBusinessType.where(sale_list_id: sale_list_id, business_type_id: product_id).count
    end

    def total_price_slip(id)
        SaleListBusinessType.where(sale_list_id: id).sum(:sale_price)
    end
end
