class DebtCapitalsController < Admin::AdminTemplateController
  before_action :set_debt_capital, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :new, :create, :show, :edit, :update]

  # GET /debt_capitals
  # GET /debt_capitals.json
  def index
    @categories = Category.where(created_by: current_user.id)
    @debt_capitals = DebtCapital.filter(params.slice(:category_id, :note))
    @debt_capitals = @debt_capitals.where(created_by: current_user.id).order(date: :desc)
  end

  # GET /debt_capitals/1
  # GET /debt_capitals/1.json
  def show
  end

  # GET /debt_capitals/new
  def new
    @debt_capital = DebtCapital.new
  end

  # GET /debt_capitals/1/edit
  def edit
  end

  # POST /debt_capitals
  # POST /debt_capitals.json
  def create
    @debt_capital = DebtCapital.new(debt_capital_params)
    @debt_capital.created_by = current_user.id

    respond_to do |format|
      if @debt_capital.save
        format.html { redirect_to debt_capitals_path, notice: 'Debt capital was successfully created.' }
        format.json { render :show, status: :created, location: @debt_capital }
      else
        format.html { render :new }
        format.json { render json: @debt_capital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debt_capitals/1
  # PATCH/PUT /debt_capitals/1.json
  def update
    @debt_capital.updated_by = current_user.id
    respond_to do |format|
      if @debt_capital.update(debt_capital_params)
        format.html { redirect_to debt_capitals_path, notice: 'Debt capital was successfully updated.' }
        format.json { render :show, status: :ok, location: @debt_capital }
      else
        format.html { render :edit }
        format.json { render json: @debt_capital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debt_capitals/1
  # DELETE /debt_capitals/1.json
  def destroy
    @debt_capital.destroy
    respond_to do |format|
      format.html { redirect_to debt_capitals_url, notice: 'Debt capital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt_capital
      @debt_capital = DebtCapital.find(params[:id])
    end

    def set_title
      @title = t("menu_title.business.debt_capital." + params[:action])
    end

    # Only allow a list of trusted parameters through.
    def debt_capital_params
      params.require(:debt_capital).permit(:date, :category_id, :amount, :note)
    end
end
