require 'rails_helper'

describe "the business owner", type: :feature do
  it "can edit its discription" do
    pending
    user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)
    visit show_user_business_path(user.slug)
    expect(page).to have_content("discription")
    click_link_or_button("edit discription")
  end
end
