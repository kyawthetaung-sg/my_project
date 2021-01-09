class PrintController < PrintTemplateController
  def sale_lists_print
    @sale_lists = SaleList.filter(params.slice(:debt, :customer_id, :product_id, :start_date, :end_date, :note))
    @sale_lists = @sale_lists.where(created_by: current_user.id).order(date: :desc)
  end

  def sale_lists_slip
    @sale_list = SaleList.find(params[:id])
    @sale_list_products = SaleListBusinessType.where(sale_list_id: params[:id]).select(:business_type_id).distinct
  end
end
