class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def twiter
  #     contact = UsrContact.from_omniauth(request.env['omniauth.auth'])
  #   if contact.persisted?
  #     sign_in_and_redirect contact, notice: 'Signed in!!'
  #   else
  #     session["devise.usr_contact_attributes"] = contact.attributes
  #     redirect_to new_usr_contact_registration_path
  #   end
  # end
#  alias_method :twiter, :all
  def twitter
    contact = UsrContact.from_omniauth(request.env["omniauth.auth"])
    if contact.persisted?
      #flash.notice = "You have successfully signed in #{current_usr_contact}"
      flash.notice = "You have successfully signed in !"
      sign_in_and_redirect contact
    else
      session["devise.usr_contact_attributes"] =  contact.attributes
      redirect_to new_usr_contact_registration_path
    end
  end

  def facebook
    contact = UsrContact.from_omniauth(request.env["omniauth.auth"])
    if contact.persisted?
      flash.notice = "You have successfully signed in !"
      sign_in_and_redirect contact
    else
      session["devise.usr_contact_attributes"] =  contact.attributes
      redirect_to new_usr_contact_registration_path
    end
  end

  def google_oauth2
    contact = UsrContact.from_omniauth(request.env["omniauth.auth"])
    if contact.persisted?
      flash.notice = "You have successfully signed in !"
      sign_in_and_redirect contact
    else
      session["devise.usr_contact_attributes"] =  contact.attributes
      redirect_to new_usr_contact_registration_path
    end
  end

  def linkedin
    contact = UsrContact.from_omniauth(request.env["omniauth.auth"])
    if contact.persisted?
      flash.notice = "You have successfully signed in !"
      sign_in_and_redirect contact
    else
      session["devise.usr_contact_attributes"] =  contact.attributes
      redirect_to new_usr_contact_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end
