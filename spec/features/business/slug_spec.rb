require "rails_helper"

describe "business show page", type: :feature do
  before :each do
    @business = FactoryGirl.create(:business)
    @item = FactoryGirl.create(:item, business_id: @business.id)
    @item2 = FactoryGirl.create(:item2, business_id: 4)
    visit show_business_path(@business.slug)
  end

  it "displays businesses that belong to it" do
    expect(page).to have_content("Water bottle")
  end

  it "doesn't have items that don't belong to business" do
    expect(page).to_not have_content(@item2.title)
  end
end
