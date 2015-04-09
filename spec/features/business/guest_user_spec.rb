require "rails_helper"

describe "Business" do
  context "guest" do
    it "can view see the description" do
      business = FactoryGirl.create(:business)
      visit show_business_path(business.slug)
    end

    it "can not edit a business" do
      user = create(:user)
      business_owner = create(:business_owner)
      business = create(:business, user: business_owner)
      allow_any_instance_of(ApplicationController).to receive(:current_user).
        and_return(user)
      visit edit_business_path(business.id)
      expect(current_path).to eq(root_path)
    end
  end
end
