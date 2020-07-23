class ThemesController < Admin::AdminTemplateController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # GET /themes
  # GET /themes.json
  def index
    @title = "Themes"
    @themes = Theme.where(created_by: current_user).or(Theme.where(created_by: nil))
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
    @title = "Theme Details"
  end

  # GET /themes/new
  def new
    @title = "New Theme"
    @theme = Theme.new
  end

  # GET /themes/1/edit
  def edit
    @title = "Editing Theme"
  end

  # POST /themes
  # POST /themes.json
  def create
    @title = "New Theme"
    @theme = Theme.new(theme_params)
    @theme.created_by = current_user.id

    respond_to do |format|
      if @theme.save
        format.html { redirect_to themes_path, notice: 'Theme was successfully created.' }
        format.json { render :show, status: :created, location: @theme }
      else
        format.html { render :new }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /themes/1
  # PATCH/PUT /themes/1.json
  def update
    @title = "Editing Theme"
    @theme.updated_by = current_user.id
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to themes_path, notice: 'Theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :edit }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme.deleted_by = current_user.id
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to themes_url, notice: 'Theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_user_theme
    @user_theme = User.find(current_user.id)
    respond_to do |format|
      if @user_theme.update(theme_id: params[:id])
        format.html { redirect_to themes_path, notice: 'User theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :index }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theme_params
      params.require(:theme).permit(:name, :color)
    end
end
