require "rails_helper"

RSpec.describe "Unauthenticated user", type: :feature do
  context "when visiting a business' page that does not exist" do
    it "should return a 404 error page" do
      visit "/business-does-not-exist"
      expect(page.status_code).to eq(404)
    end
  end

  it "should be able to visit a business page" do
    business_owner = create(:business_owner)
    business = Business.create!(name: "New business", user: business_owner)
    visit show_business_path(business.slug)
    within(".jumbotron") do
      expect(page).to have_content("New business")
    end
  end
end
