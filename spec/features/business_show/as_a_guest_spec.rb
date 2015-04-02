require "rails_helper"

describe " a guest" do
  it "can view see the description" do
    user = FactoryGirl.create(:user)
    business = FactoryGirl.create(:business)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)
    visit business_path(business.id)
  end
end
