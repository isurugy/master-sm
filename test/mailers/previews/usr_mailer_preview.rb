# Preview all emails at http://localhost:3000/rails/mailers/usr_mailer
class UsrMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/usr_mailer/usr_additional_signup
  def usr_additional_signup
    UsrMailer.usr_additional_signup
  end

end
