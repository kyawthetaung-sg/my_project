class HomeController < Admin::AdminTemplateController
  def index
    @title = "Home"
    @sale_products = SaleListBusinessType.where(created_by: current_user.id)
  end
end
