class PrintController < PrintTemplateController
  def sale_lists_print
    @sale_lists = SaleList.filter(params.slice(:customer_id, :start_date, :end_date, :note))
    @sale_lists = @sale_lists.where(created_by: current_user.id).order(date: :desc)
  end
end
