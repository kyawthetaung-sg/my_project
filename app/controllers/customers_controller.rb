class CustomersController < Admin::AdminTemplateController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @title = "Customer Lists"
    @customers = Customer.where(["name LIKE ?", "%#{params[:name]}%"]).where(created_by: current_user.id)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @title = "Customer Details"
  end

  # GET /customers/new
  def new
    @title = "Customer Creation"
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @title = "Customer Editing"
  end

  # POST /customers
  # POST /customers.json
  def create
    @title = "Customer Creation"
    @customer = Customer.new(customer_params)
    @customer.created_by = current_user.id

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @title = "Customer Editing"
    @customer.created_by = current_user.id
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :phone_number, :address, :note)
    end
end
