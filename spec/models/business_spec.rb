require "rails_helper"

describe "Business", :type => :model do

  context "validations" do
    let(:user) { create :user }
    let(:business) { Business.new(user: user, name: "New Water Merchant") }

    it "requires user" do
      business = Business.new(name: "New Water Merchant")
      expect(business.save).to eq(false)
      business.user = user
      expect(business.save).to eq(true)
    end
  end
end
