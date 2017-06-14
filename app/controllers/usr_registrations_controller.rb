class UsrRegistrationsController < Devise::RegistrationsController
  def user_email
    @user_email = UsrContact.find(id= current_usr_contact.id).email
  end

  def create
    build_resource(sign_up_params)
    additional_user = UsrAdditionalUser.all
    resource.save

   # resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end

        @emailSet = []
        if params[:usr_contact][:usr_contact_vendors_attributes] != nil
          @emailAdd = params[:usr_contact][:usr_contact_vendors_attributes]["0"][:usr_vendor_property_attributes][:usr_additional_users_attributes]
        end

        #Rails.logger.debug("Myzzzz: #{@emailAdd.inspect}")
		if @emailAdd != nil
          @emailAdd.each do |key, value|
            if value[:email] != ""
              @emailSet << value[:email]
              additionalUseremail = value[:email]
              additionalUserRole = value[:role]
              UsrMailer.usr_additional_signup(additionalUseremail, additionalUserRole).deliver_now
            end
          end
		end
        #Rails.logger.debug("My ararrryyyyyyyyyyyy: #{@emailSet.inspect}")

        # additioanal user save
        additional_user.each do |additioalUser|
          if (additioalUser.email == params[:usr_contact][:email])
            contact_id = UsrContact.find_by_email(params[:usr_contact][:email]).id # get userContat_id by filtering the given email address
            additional_user_roles = additional_user.find_by_email( params[:usr_contact][:email]).role # take additional users all rols as string comma separated
            roles_array = additional_user_roles.split(",") # split and convert into array
            roles_array.each do |val|
              role_id = UsrRole.find_by_role_name(val).id #get role_id by role name
              @usr_contact_role = UsrContactRole.new(:usr_contact_id=>contact_id, :usr_role_id=>role_id) #save contact_id and role_id to the
              @usr_contact_role.save
            end
          end
        end

      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
    end
  end


  private

 def sign_up_params
    params.require(:usr_contact).permit(:first_name, :last_name, :dob, :gender,
                                        :mobile, :email, :password,
                                        :password_confirmation,
                                        :image,
                                        usr_contact_vendors_attributes:
                                            [:id, usr_vendor_property_attributes:
                                                [:shop_name, :specified_area, :mobile, :website,
                                                 usr_vendor_branches_attributes:
                                                     [:address_line1, :address_line2, :city ,:zip_code ],
                                                 usr_additional_users_attributes:[:id,:email,:role, :_destroy]]] )
  end

  def account_update_params
    params.require(:usr_contact).permit(:first_name, :last_name, :dob, :gender, :mobile,:image, :password, :password_confirmation, :current_password,:email=>@user_email)
  end

end
