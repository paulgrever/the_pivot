require "rails_helper"

RSpec.describe "Business owner", type: :feature do
  it "has access to an 'Edit business profile' link for their business" do
    business_owner = create(:business_owner)
    business_owner.make_business_owner
    business = Business.create!(user: business_owner,
                                name: "New Water Merchant")

    visit show_business_path(business.slug)
    expect(page).to have_content("Update Business Information")
  end

  xit "should not have access to edit another user's business page" do
    business_owner = create(:business_owner)
    business_owner.make_business_owner
    other_business_owner = create(:business_owner2)
    other_business_owner.make_business_owner
    Business.create!(name: "New Water Merchant",
                     user: business_owner)
    other_business = Business.create!(name: "Other Business",
                                      user: other_business_owner)
    login(business_owner)

    visit show_business_path(other_business.slug)
    expect(page).not_to have_content("Update Business Information")
  end

  it "can update their business info" do
    business_owner = create(:business_owner)
    business_owner.make_business_owner
    business = Business.create!(user: business_owner,
                                name: "New Water Merchant")
    login(business_owner)

    visit show_business_path(business.slug)
    click_link_or_button("Update Business")
    fill_in("Name", with: "new business name")
    click_link_or_button("Update Business")
    expect(page).to have_content("new business name")
  end

  it "can't update their name to an existing business name" do
    business_owner = create(:business_owner)
    business_owner.make_business_owner
    business = Business.create!(user: business_owner,
                                name: "New Water Merchant")
    other_business = Business.create!(name: "Other Business",
                                      user: business_owner)
    login(business_owner)

    visit show_business_path(business.slug)
    click_link_or_button("Update Business")
    fill_in("Name", with: other_business.name)
    click_link_or_button("Update Business")
    expect(page).to have_content("Your business was not updated")
    expect(page).to_not have_content("Other Business")
  end
end
