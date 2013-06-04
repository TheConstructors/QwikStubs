require 'open-uri'

class UserMailer < ActionMailer::Base
  default from: "do_not_reply@qwikstubs.com"

  def welcome_email(user)
    @user = user
    @url  = "www.qwikstubs.com/login"

    attachments.inline['logo-tiny.png'] = File.read('app/assets/images/logo-tiny.png')
    mail(:to => @user.get_email, :subject => "Welcome to Qwikstubs!")
  end

  def confirmation_email(order, email)
    @order = order
    @email = email
    @url   = "www.qwikstubs.com/orders/#{order.id.to_s}/checkin"

    # QR encoding
    @qr_code  = "http://chart.googleapis.com/chart?cht=qr&chs=300x300&chl=#{@url}&choe=UTF-8"
    @image = open(@qr_code).read
    attachments.inline['qr_code.png'] = @image

    attachments.inline['logo-tiny.png'] = File.read('app/assets/images/logo-tiny.png')
    mail(:to => @email, :subject => "Qwikstubs Confirmation for Order #{@order.order_number}")
  end
end
