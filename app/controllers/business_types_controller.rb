class BusinessTypesController < Admin::AdminTemplateController
  before_action :set_business_type, only: [:show, :edit, :add, :update, :destroy]

  # GET /business_types
  # GET /business_types.json
  def index
    @title = "Product Lists"
    @categories = Category.where(created_by: current_user.id)
    @business_types = BusinessType.filter(params.slice(:category_id, :name))
    @business_types = @business_types.where(created_by: current_user.id).page(params[:page]).per(params[:limit])
  end

  # GET /business_types/1
  # GET /business_types/1.json
  def show
    @title = "Product Details"
  end

  # GET /business_types/new
  def new
    @title = "Product Creation"
    @business_type = BusinessType.new
  end

  # GET /business_types/1/edit
  def edit
    @title = "Product Editing"
  end

  # GET /business_types/1/add
  def add
    @title = "Product Adding"
  end

  # POST /business_types
  # POST /business_types.json
  def create
    @title = "Product Creation"
    @business_type = BusinessType.new(business_type_params)
    @business_type.created_by = current_user.id

    respond_to do |format|
      if @business_type.save
        format.html { redirect_to business_types_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @business_type }
      else
        format.html { render :new }
        format.json { render json: @business_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_types/1
  # PATCH/PUT /business_types/1.json
  def update
    @title = "Product Editing"
    if params[:commit] != "Add"
      @business_type.created_by = current_user.id
      respond_to do |format|
        if @business_type.update(business_type_params)
          format.html { redirect_to business_types_path, notice: 'Product was successfully updated.' }
          format.json { render :show, status: :ok, location: @business_type }
        else
          format.html { render :edit }
          format.json { render json: @business_type.errors, status: :unprocessable_entity }
        end
      end
    else
      @old_qty = @business_type.quantity
      @new_qty = params.require(:business_type).permit(:add_quantity)[:add_quantity].to_i
      @total_qty = @old_qty + @new_qty
      respond_to do |format|
        if @business_type.update(quantity: @total_qty)
          format.html { redirect_to business_types_path, notice: 'Product was successfully added.' }
          format.json { render :show, status: :ok, location: @business_type }
        else
          format.html { render :add }
          format.json { render json: @business_type.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /business_types/1
  # DELETE /business_types/1.json
  def destroy
    @business_type.destroy
    respond_to do |format|
      format.html { redirect_to business_types_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_type
      @business_type = BusinessType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_type_params
      params.require(:business_type).permit(:name, :purchase_price, :sale_price, :quantity, :category_id)
    end
end
