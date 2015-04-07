class SignUpMailer < ApplicationMailer
  default from: "droply.supplies@gmail.com"

  def sign_up_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Droply')
  end
end
