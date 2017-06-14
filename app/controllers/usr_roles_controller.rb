class UsrRolesController < ApplicationController

  def index
    @roles = UsrRole.all # show all users
  end

  def new
    @role = UsrRole.new
    @role_permissions = @role.usr_role_permissions.build
  end

  def create
    @role = UsrRole.new(role_params)
    count = 1
    params[:usr_permissions][:id].each do |permission|

      @print = params[:x1]

      unless permission.empty?
        @role.usr_role_permissions.build(usr_permission_id: permission, value: @print)
      end
      count += 1
    end
    if @role.save
      redirect_to usr_roles_path
    else
      render 'new'
    end
  end

  def show
    @role = UsrRole.find(params[:id])
    @permissions = @role.usr_permissions
    @role_permissions = @role.usr_role_permissions.build
  end

  private

    def role_params
    params.require(:usr_role).permit(:role_name, :description)
    end

end
