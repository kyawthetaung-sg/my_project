class ProductSaleListsController < Admin::AdminTemplateController
  def index
    @title = 'Product Sale Lists'
    @categories = Category.where(created_by: current_user.id).order("name ASC")
    @product_sale_lists = SaleListBusinessType.where(created_by: current_user.id)
    if params[:category_id] && params[:category_id] != ""
      @product_sale_lists = @product_sale_lists.joins(:business_type).where(business_types: {category_id: params[:category_id]})
    elsif params[:name] && params[:name] != ""
       @product_sale_lists = @product_sale_lists.joins(:business_type).where(business_types: {name: params[:name]})
    end
    @product_sale_lists = @product_sale_lists.select(:business_type_id, :sale_price).distinct
  end
end
