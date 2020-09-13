module ProductSaleListsHelper
    def total_qty(id, sale_price)
        SaleListBusinessType.where(business_type_id: id, sale_price: sale_price).count
    end
end
