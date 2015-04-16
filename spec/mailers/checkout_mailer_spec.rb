require "rails_helper"

RSpec.describe CheckoutMailer, type: :mailer do
  let(:user) { User.create(full_name: "Lucas", email: "lucas@email.com", password: "test") }
  let(:status) { Status.create(state: "Ordered") }
  let(:order) { Order.create( user_id: user.id, status_id: status.id) }
  let(:mail) { CheckoutMailer.checkout_email(user, order) }

  it "renders the subject" do
    expect(mail.subject).to eql("Your Droply Order")
  end

  it "renders the receiver email" do
    expect(mail.to).to eql([user.email])
  end

  it "renders the sender email" do
    expect(mail.from).to eql(["droply.supplies@gmail.com"])
  end
end
