class ProductSalesController < Admin::AdminTemplateController
  def index
    @title = "Product Sale"
    @categories = Category.where(created_by: current_user.id)
    @business_types = BusinessType.where(created_by: current_user.id)
    @customers = Customer.where(created_by: current_user.id)
  end

  def checkout
    render json: { message: "Checkout Complete!" }
  end
end
