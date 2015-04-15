require "rails_helper"

RSpec.describe "Business owner", type: :feature do
  context "when on their business main page" do
    xit "has access to an 'Edit business profile' link" do
      business_owner = create(:business_owner)
      business_owner.make_business_owner
      business = Business.create(user: business_owner, name: "New Water Merchant")

      visit show_business_path(business.slug)
      expect(page).to have_content("Edit business profile")
    end
  end
end
