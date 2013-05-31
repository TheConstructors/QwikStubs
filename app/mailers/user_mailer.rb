class UserMailer < ActionMailer::Base
  default from: "do_not_reply@qwikstubs.com"

  def welcome_email(user)
    @user = user
    @url  = "www.qwikstubs.com/login"
    attachments.inline['logo-tiny.png'] = File.read('app/assets/images/logo-tiny.png')
    mail(:to => @user.get_email, :subject => "Welcome to Qwikstubs!")
  end
end
