class ReportsController < Admin::AdminTemplateController
  def index
    @title = t("menu_title.report")
    @categories = Category.where(created_by: current_user.id)
    @business_types = BusinessType.where(created_by: current_user.id)
    @sale_products = SaleListBusinessType.where(created_by: current_user.id)
  end
end
