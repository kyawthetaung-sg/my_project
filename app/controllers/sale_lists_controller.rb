class SaleListsController < Admin::AdminTemplateController
  def index
    @title = "Sale Lists"
    @sale_lists = SaleList.where(created_by: current_user)
  end
end
