class AccountsController < Admin::AdminTemplateController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :permission_account
  # check direct accept url has permission or not
  def permission_account
    unless has_permission("account_read")
      @title = "Accept Deny"
      render template: "layouts/error_page"
    end
  end

  def has_permission(name)
    role = current_user.role
    if role.id == 1
        return true
    else
        role.permissions.pluck(:name).include? name
    end
  end
  # GET /accounts
  # GET /accounts.json
  def index
    @title = t("menu_title.user_management.account.index")
    @accounts = Account.where(deleted_at: nil)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @title = t("menu_title.user_management.account.detail")
  end

  # GET /accounts/new
  def new
    @title = t("menu_title.user_management.account.new")
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @title = t("menu_title.user_management.account.update")
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @title = t("menu_title.user_management.account.create")
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    @title = t("menu_title.user_management.account.update")
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.update(deleted_at: DateTime.now, deleted_by: current_user.id)
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation, :role_id, :theme_id)
    end
end
