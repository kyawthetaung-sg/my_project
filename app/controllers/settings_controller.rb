class SettingsController < Admin::AdminTemplateController
  before_action :set_user, only: [:edit_language, :update_language]

  def index
    @title = "Setting"
  end

  def edit_language
    @title = t("menu_title.setting.edit_language")
    @languages = {"English" => 1, "Japanese" => 2, "Myanmar" => 3}
  end

  def update_language
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to settings_path, notice: 'Language successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:language)
    end
end
