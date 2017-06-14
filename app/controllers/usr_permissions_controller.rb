class UsrPermissionsController < ApplicationController

  def index
    @permissions = UsrPermission.all
  end

  def new
    @permission = UsrPermission.new
  end

  def create
    @permission = UsrPermission.new(permission_params)

    if @permission.save
      redirect_to usr_permissions_path
    else
      render 'new'
    end
  end

  private

  def permission_params
    params.require(:usr_permission).permit(:permission_name)
  end

end
