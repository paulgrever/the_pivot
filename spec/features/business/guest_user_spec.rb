require "rails_helper"

describe "Business" do
  context "guest" do
    let(:user) { create(:user) }
    let(:business_owner) { create(:business_owner) }
    it "can see the description" do
      business = Business.create!(user: business_owner, name: "New Water Merchant")
      visit show_business_path(business.slug)
    end

    it "can not edit a business" do
      business = Business.create(user: business_owner, name: "New Water Merchant")
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit edit_business_path(business.id)
      expect(current_path).to eq(root_path)
    end
  end
end
