class ExpensesController < Admin::AdminTemplateController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @title = 'Expnese'
    @expense_categories = ExpenseCategory.where(created_by: current_user.id).or(ExpenseCategory.where(created_by: nil))
    @payment_modes = PaymentMode.where(created_by: current_user.id).or(PaymentMode.where(created_by: nil))

    @expenses = Expense.filter(params.slice(:expense_category_id, :payment_mode_id, :note, :start_date, :end_date))
    @expenses = @expenses.where(created_by: current_user.id)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @title = 'Expnese'
  end

  # GET /expenses/new
  def new
    @title = 'Expnese'
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
    @title = 'Expnese'
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @title = 'Expnese'
    @expense = Expense.new(expense_params)
    @expense.created_by = current_user.id

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    @title = 'Expnese'
    @expense.created_by = current_user.id
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_path, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:date, :amount, :expense_category_id, :payment_mode_id, :note)
    end
end
