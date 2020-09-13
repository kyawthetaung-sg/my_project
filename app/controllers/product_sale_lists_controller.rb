class ProductSaleListsController < Admin::AdminTemplateController
  def index
    @title = 'Product Sale Lists'
    @categories = Category.where(created_by: current_user.id)

    if params[:category_id]
      @product_sale_lists = SaleListBusinessType.where(created_by: current_user.id).joins(:business_type).where(business_types: {category_id: params[:category_id]}).select(:business_type_id, :sale_price).distinct
    else
      @product_sale_lists = SaleListBusinessType.where(created_by: current_user.id).select(:business_type_id, :sale_price).distinct
    end
  end
end
