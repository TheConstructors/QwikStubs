class UserMailer < ActionMailer::Base
  default from: "do_not_reply@qwikstubs.com"

  def welcome_email(user_email)
    @user_email = user_email
    @url  = "localhost:3000/login"
    attachments.inline['logo-tiny.png'] = File.read('app/assets/images/logo-tiny.png')
    mail(:to => @user_email.email, :subject => "Welcome to Qwikstubs!")
  end
end
