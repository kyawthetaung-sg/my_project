class RolesController < Admin::AdminTemplateController
  before_action :set_role, only: [:show, :edit, :update, :destroy, :permission]
  before_action :permission_role
  # check direct accept url has permission or not
  def permission_role
    unless has_permission("role_read")
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
  # GET /roles
  # GET /roles.json
  def index
    @title = "Roles"
    @roles = Role.where(deleted_at: nil)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @title = "Role Details"
  end

  # GET /roles/new
  def new
    @title = "New Role"
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
    @title = "Role Editing"
  end

  # POST /roles
  # POST /roles.json
  def create
    @title = "New Role"
    @role = Role.new(role_params)
    @role.created_by = current_user.id

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    @title = "Role Editing"
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to roles_path, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def permission
    @title = t("menu_title.user_management.role.permission")
  end

  def create_permission
    @permission = Permission.where(role_id: params[:id], name: params[:name]).first
    unless @permission
      @new_permission = Permission.new
      @new_permission.role_id = params[:id]
      @new_permission.name = params[:name]
      @new_permission.save
    else
      @permission.destroy
    end

    render json: { message: "success" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:name)
    end
end
