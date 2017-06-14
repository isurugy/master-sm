class UsrVenderController < ApplicationController

  def index
    @val = 2;
    # @usrAdditionalUser = Array.new(@val){
    #   UsrAdditionalUser.new(additional_user).save
    # }
    # @usrAdditionalUser = UsrAdditionalUser.new
    # 2.times{@usrAdditionalUser.email.build}


    # @existingAdditionalUsers = UsrAdditionalUser.all
    # @contacts  = UsrContact.all
      if UsrAdditionalUser.exists?(email: params[:additional_user][:email])
        set_flash_message! :notice, :"email is already existing !"
      else if UsrContact.exists?(email: params[:additional_user][:email])
             set_flash_message! :notice, :"email is already existing !"
           else
             @usrAdditionalUser = UsrAdditionalUser.new(additional_user)
             @usrAdditionalUser.save
           end

      end
    # @usrAdditionalUser = UsrAdditionalUser.new(additional_user)
    # @usrAdditionalUser.save

  end

  def new
     @vender_shop_details = UsrVenderProperty.new
     @vender_shop_details.usr_additional_users.build

    @vender_branch_details = UsrVenderBranch.new
    @roles = UsrRole.all

  end

  def create_shop_details
    @vender_shop_details = UsrVenderProperty.new(vender_property_params)
    @currentuser = current_usr_contact
    @user_contct_vender = UsrContactVender.new()


    if @vender_shop_details.save
      UsrMailer.usr_additional_signup(@vender_shop_details).deliver

      @vender_property_last = UsrVenderProperty.last.id
      @user_contct_vender.usr_contacts_id =  @currentuser.id
      @user_contct_vender.usr_vender_properties_id = @vender_property_last
      if @user_contct_vender.save &&  @vender_branch_details.save
        redirect_to root_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def create_branch_details
    @vender_branch_details = UsrVenderBranch.new(vender_branch_params)
    @vender_branch_details.usr_vender_property_id = @vender_property_last
    if @vender_branch_details.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js # render usr_vender/create_branch_details.js.erb
      end
    else
      render new

    end
  end


  private
  def vender_property_params
    params.require(:usr_vender_property).permit(:specifiedArea, :mobile, :shop_name, :website, usr_additional_users_attributes: UsrAdditionalUser.attributes_names.map(&:to_sym).push(:destroy))
  end
  def vender_branch_params
    params.require(:usr_vender_branch).permit(:address_line1, :address_line2, :city, :zip_code)
  end

  def additional_user
    # params.require(:additional_user).permit(:email,:role)
    #params.require(:additional_user).permit(additional_user_attributes: UsrAdditionalUser.attributes_name.map(&:to_sym).push(:destroy))
  end
end

