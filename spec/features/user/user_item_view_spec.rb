require 'rails_helper'

describe "the user item view", type: :feature do
  before :each do
    @item = FactoryGirl.create(:item)
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in("session_email", with: user.email)
    fill_in("session_password", with: user.password)
    click_button 'Sign in'
    visit items_path
  end

  it "displays all the items on the index page" do
    expect(page).to have_content(@item.title)
  end

  it "displays the description of the individual item on the show page" do
    click_link_or_button(@item.title)
    expect(current_path).to eq(item_path(@item))
    expect(page).to have_content(@item.description)
  end

  it "can add to cart" do
    visit item_path(@item)
    within "#cart" do
      expect(page).to have_content("0")
    end
    click_link_or_button "Add to cart"
    within "#cart" do
      expect(page).to have_content("1")
    end
  end
end
