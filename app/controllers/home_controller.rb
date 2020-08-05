class HomeController < Admin::AdminTemplateController
  def index
    @title = "Home"
    @categories = Category.where(created_by: current_user.id)
    @business_types = BusinessType.where(created_by: current_user.id)
  end
end
