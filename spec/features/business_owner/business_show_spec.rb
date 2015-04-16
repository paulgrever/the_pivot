require "rails_helper"

RSpec.describe "Business owner", type: :feature do
  context "when on their business main page" do
    it "has access to an 'Edit business profile' link" do
      business_owner = create(:business_owner)
      business_owner.make_business_owner
      business = Business.create(user: business_owner, name: "New Water Merchant")

      visit show_business_path(business.slug)
      expect(page).to have_content("Update Business Information")
    end
    it "can update their business info" do
      business_owner = create(:business_owner)
      business_owner.make_business_owner
      business = Business.create(user: business_owner, name: "New Water Merchant")
      visit show_business_path(business.slug)
      click_link_or_button("Update Business")
      expect(current_path).to eq(edit_business_path(business.slug))
      fill_in("Name", with: "new business name")
      click_link_or_button("Update Business")
      expect(page).to have_content("new business name")
    end

    it "can't update to an existing business" do
      business_owner = create(:business_owner)
      business_owner.make_business_owner
      business = Business.create(user: business_owner, name: "New Water Merchant")
      other_business = Business.create!(name: "Other Business", user: business_owner,)
      visit show_business_path(business.slug)
      click_link_or_button("Update Business")
      expect(current_path).to eq(edit_business_path(business.slug))
      fill_in("Name", with: other_business.name)
      click_link_or_button("Update Business")
      expect(page).to_not have_content("Other Business")
    end
  end
end
