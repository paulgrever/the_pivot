require 'rails_helper'

describe "the admins order view", type: :feature do
  before :each do
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
    @order = FactoryGirl.create(:order, user_id: @user.id)
    @order2 = FactoryGirl.create(:order)
    visit login_path
    fill_in("session_email", with: @admin.email)
    fill_in("session_password", with: @admin.password)
    click_button 'Sign in'
    visit admin_orders_path
  end

  it "displays all the orders on the index page" do
    expect(page).to have_content("Orders")
  end

  it "displays links for each individual order if there are orders" do
    expect(page).to have_content("click here")
  end

  it "shows each orders indivdual information" do
    within('table tr:nth-child(2)') do
      click_link_or_button("click here")
    end
      expect(page).to have_content("Details for Order ID:")
  end

  it "displays the order status" do
    expect(page).to have_content("Status")
  end

  it "displays order date and time" do
   within('table tr:nth-child(2)') do
      click_link_or_button( 'click here')
    end
  end

  xit "displays a total number of orders by status type" do
  end

  xit "filters orders to display by status type" do
  end

  xit "link to transition to a different status " do
  end

  xit "displays total for the order" do
    expect(page).to have_content("Cost")
  end
end
