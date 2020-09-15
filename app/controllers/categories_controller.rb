class CategoriesController < Admin::AdminTemplateController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @title = "Business Category Lists"
    @categories = Category.where(created_by: current_user.id).order(:name)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @title = "Business Category Details"
  end

  # GET /categories/new
  def new
    @title = "Business Category Creation"
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @title = "Business Category Editing"
  end

  # POST /categories
  # POST /categories.json
  def create
    @title = "Business Category Creation"
    @category = Category.new(category_params)
    @category.created_by = current_user.id

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @title = "Business Category Editing"
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :show_sale, :show_report)
    end
end
