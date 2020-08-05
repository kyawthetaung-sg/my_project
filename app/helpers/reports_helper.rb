module ReportsHelper
    def sould_out_quantity(id)
        SaleListBusinessType.where(business_type_id: id).count
    end
end
