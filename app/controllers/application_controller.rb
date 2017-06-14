class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private
  def after_sign_in_path_for(resource)
    if UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id)
      vendor_id = UsrContactVendor.find_by_usr_contact_id(current_usr_contact.id).usr_vendor_property_id
      usr_vendor_property_path(vendor_id)
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end


  end


  # private
  # def after_sign_in_path_for(resource)
  #  #if session[:userType].nil?
  #
  #  # if Rails.application.config.session_store key:'userType' == "sellert"
  #   #if cookies[:userType] == "seller"
  #   if session[:userType]=='sellerZ'
  #     usr_register_path
  #   else
  #     root_path
  #   end
  # end
end
