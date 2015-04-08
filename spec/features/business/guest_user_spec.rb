require "rails_helper"

describe "A guest" do
  it "can view see the description" do
    business = FactoryGirl.create(:business)
    visit show_business_path(business.slug)
  end
end
