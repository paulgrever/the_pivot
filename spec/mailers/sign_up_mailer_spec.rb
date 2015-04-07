require "rails_helper"

RSpec.describe SignUpMailer, type: :mailer do
  def sample_mail_preview
    ExampleMailer.sample_email(User.first)
  end
end
