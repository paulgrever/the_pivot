# Preview all emails at http://localhost:3000/rails/mailers/sign_up_mailer
class SignUpMailerPreview < ActionMailer::Preview
  def signin_mail_preview
    SignUpMailer.sign_up_email(User.first)
  end
end
