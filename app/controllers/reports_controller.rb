class ReportsController < Admin::AdminTemplateController
  def index
    @title = t("menu_title.report")
    @categories = Category.where(created_by: current_user)
    @business_types = BusinessType.where(created_by: current_user)

    @sale_products = SaleListBusinessType.select(:business_type_id).distinct.where(created_by: current_user.id)
  end
end
