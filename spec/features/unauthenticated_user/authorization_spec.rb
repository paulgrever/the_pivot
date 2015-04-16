require "rails_helper"

RSpec.describe "Unauthenticated user", type: :feature do
  it "should not be able to visit a user's profile page" do
    user = create(:user)
    visit user_path(user)
    expect(current_path).to eq(root_path)
  end

  xit "should not be able to create a new business" do
    visit new_business_path
    expect(current_path).to eq(root_path)
  end

  it "should not be able to view a business edit page" do
    business_owner = create(:business_owner)
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
