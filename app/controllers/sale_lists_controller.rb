class SaleListsController < Admin::AdminTemplateController
  before_action :set_sale_list, only: [:show, :edit, :update, :update_images, :destroy]

  def index
    @title = "Sale Lists"
    @customers = Customer.where(created_by: current_user)

    @sale_lists = SaleList.filter(params.slice(:customer_id, :start_date, :end_date))
    @sale_lists = @sale_lists.where(created_by: current_user.id)
  end

  def destroy
    SaleListBusinessType.where(sale_list_id: params[:id]).delete_all
    @sale_list.destroy
    respond_to do |format|
      format.html { redirect_to sale_lists_url, notice: 'Sale list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /sale_lists/1
  # GET /sale_lists/1.json
  def show
    @title = "Sale List Details"
  end

  def edit
    @title = "Adding Payment"
  end

  def add_images
    @title = "Adding Images"
  end

  # PATCH/PUT /sale_lists/1
  # PATCH/PUT /sale_lists/1.json
  def update
    @title = "Adding Payment"
    @first_payment = @sale_list.first_payment
    @second_payment = params.require(:sale_list).permit(:add_payment)[:add_payment].to_i
    @note = params.require(:sale_list).permit(:note)[:note]
    @total_payment = @first_payment + @second_payment

    respond_to do |format|
      if @sale_list.update(first_payment: @total_payment, note: @note)
        format.html { redirect_to sale_lists_path, notice: 'Payment was successfully added.' }
        format.json { render :show, status: :ok, location: @sale_list }
      else
        format.html { render :add }
        format.json { render json: @sale_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_images
    @title = "Adding Images"
    respond_to do |format|
      if @sale_list.update(image: params[:image])
        format.html { redirect_to sale_lists_path, notice: 'Images was successfully added.' }
        format.json { render :show, status: :ok, location: @sale_list }
      else
        format.html { render :add }
        format.json { render json: @sale_list.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_sale_list
      @sale_list = SaleList.find(params[:id])
    end
end
