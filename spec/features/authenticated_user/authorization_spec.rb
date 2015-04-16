require "rails_helper"

RSpec.describe "Authenticated user", type: :feature do
  before :each do
    user = create(:user)
    login(user)
  end

  it "cannot view another user's profile page"

  it "should not be able to view a business edit page" do
    business_owner = create(:business_owner)
    business_owner.make_business_owner
    business = Business.create(name: "New business", user: business_owner)

    visit edit_business_path(business.slug)
    expect(current_path).to eq(root_path)
  end

  it "should not be able to view admin dashboard" do
    visit admin_dashboard_path
    expect(current_path).to eq(root_path)
  end

  it "should not be able to view admin categories" do
    visit admin_categories_path
    expect(current_path).to eq(root_path)
  end
end
