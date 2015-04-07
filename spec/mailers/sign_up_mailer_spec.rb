require "rails_helper"

RSpec.describe SignUpMailer, type: :mailer do
  describe 'instructions' do
    let(:user) { User.create( full_name: 'Lucas', email: 'lucas@email.com', password: "test" )}
    let(:mail) { SignUpMailer.sign_up_email(user) }
 
    it 'renders the subject' do
      expect(mail.subject).to eql('Welcome to Droply')
    end
 
    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end
 
    it 'renders the sender email' do
      expect(mail.from).to eql(['droply.supplies@gmail.com'])
    end
 
    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.full_name)
    end
 
  end
end
