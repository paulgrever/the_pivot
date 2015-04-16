class CheckoutMailer < ApplicationMailer
  def checkout_email(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Your Droply Order ")
  end
end
