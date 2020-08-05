class ReportsController < Admin::AdminTemplateController
  def index
    @title = "Reports"
    @sale_products = SaleListBusinessType.select(:business_type_id).distinct.where(created_by: current_user.id)
  end
end
