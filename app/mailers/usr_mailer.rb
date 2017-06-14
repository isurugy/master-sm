class UsrMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usr_mailer.usr_additional_signup.subject
  #
  def usr_additional_signup(additionalUseremail, additionalUserRole)
    emailAddress= additionalUseremail
    @role = additionalUserRole
    @Url = root_url + 'usr_vendor_properties/additional_signup'

      mail(:to => emailAddress.to_s,
           :subject => "You have been invited",
           :date => Time.now)
    # mail(:to => 'chanaka.pradeep@yahoo.com',
    #      :subject => "Car details request from a client",
    #      :date => Time.now)

  end
end
