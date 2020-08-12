class IncomesController < Admin::AdminTemplateController
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  # GET /incomes
  # GET /incomes.json
  def index
    @title = 'Incomes'
    @expense_categories = ExpenseCategory.where(created_by: current_user.id).or(ExpenseCategory.where(created_by: nil))
    @payment_modes = PaymentMode.where(created_by: current_user.id).or(PaymentMode.where(created_by: nil))

    @incomes = Income.filter(params.slice(:expense_category_id, :payment_mode_id, :note, :start_date, :end_date))
    @incomes = @incomes.where(created_by: current_user.id)
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    @title = 'Incomes'
  end

  # GET /incomes/new
  def new
    @title = 'Incomes'
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
    @title = 'Incomes'
  end

  # POST /incomes
  # POST /incomes.json
  def create
    @title = 'Incomes'
    @income = Income.new(income_params)
    @income.created_by = current_user.id

    respond_to do |format|
      if @income.save
        format.html { redirect_to incomes_path, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    @title = 'Incomes'
    @income.created_by = current_user.id
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to incomes_path, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.require(:income).permit(:date, :amount, :expense_category_id, :payment_mode_id, :note)
    end
end
