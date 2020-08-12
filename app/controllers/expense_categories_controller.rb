class ExpenseCategoriesController < Admin::AdminTemplateController
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]

  # GET /expense_categories
  # GET /expense_categories.json
  def index
    @title = 'Categories'
    @expense_categories = ExpenseCategory.where(created_by: current_user.id).or(ExpenseCategory.where(created_by: nil))
  end

  # GET /expense_categories/1
  # GET /expense_categories/1.json
  def show
    @title = "Category Details"
  end

  # GET /expense_categories/new
  def new
    @title = 'New Category'
    @expense_category = ExpenseCategory.new
  end

  # GET /expense_categories/1/edit
  def edit
    @title = 'Editing Category'
  end

  # POST /expense_categories
  # POST /expense_categories.json
  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    @expense_category.created_by = current_user.id

    respond_to do |format|
      if @expense_category.save
        format.html { redirect_to expense_categories_path, notice: 'Expense category was successfully created.' }
        format.json { render :show, status: :created, location: @expense_category }
      else
        format.html { render :new }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_categories/1
  # PATCH/PUT /expense_categories/1.json
  def update
    @expense_category.created_by = current_user.id
    respond_to do |format|
      if @expense_category.update(expense_category_params)
        format.html { redirect_to expense_categories_path, notice: 'Expense category was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_category }
      else
        format.html { render :edit }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_categories/1
  # DELETE /expense_categories/1.json
  def destroy
    @expense_category.destroy
    respond_to do |format|
      format.html { redirect_to expense_categories_url, notice: 'Expense category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_category_params
      params.require(:expense_category).permit(:name)
    end
end
