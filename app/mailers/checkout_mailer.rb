class CheckoutMailer < ApplicationMailer
  def check_out_email(user)
    @user = user
    mail(to: @user.email, subject: "Your Droply Order ")
  end
end
