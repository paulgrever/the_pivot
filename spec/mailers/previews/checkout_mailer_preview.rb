# Preview all emails at http://localhost:3000/rails/mailers/checkout_mailer
class CheckoutMailerPreview < ActionMailer::Preview
  def checkout_email
    CheckoutMailer.checkout_email(User.first, Order.first)
  end
end
