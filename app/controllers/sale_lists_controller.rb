class SaleListsController < Admin::AdminTemplateController
  before_action :set_sale_list, only: [:show, :edit, :update, :destroy]

  def index
    @title = "Sale Lists"
    @sale_lists = SaleList.where(created_by: current_user)
    @customers = Customer.where(created_by: current_user)
  end

  def destroy
    SaleListBusinessType.where(sale_list_id: params[:id]).delete_all
    @sale_list.destroy
    respond_to do |format|
      format.html { redirect_to sale_lists_url, notice: 'Sale list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sale_list
      @sale_list = SaleList.find(params[:id])
    end
end
