require 'rails_helper'

describe "the order view", type: :feature do

  before :each do
    @admin = FactoryGirl.create(:admin)
    @order = FactoryGirl.create(:order)
    @order2 = FactoryGirl.create(:order)
    @user = FactoryGirl.create(:user)
    visit login_path
    fill_in("session_email", with: @admin.email)
    fill_in("session_password", with: @admin.password)
    click_button 'Sign in'
    visit orders_path
  end

  it "displays all the orders on the index page" do
    expect(page).to have_content("Orders")
  end

  it "displays links for each individual order if there are orders" do

    expect(page).to have_content("click here")
  end

  it "shows each orders indivdual information" do
    binding.pry
    click_link_or_button("click here")
    expect(page).to have_content("Details for Order ID:")
  end

  it "displays the order status" do
    visit orders_path
    expect(page).to have_content(@order.status_id)
  end

  it "displays order date and time" do
    visit orders_path
    click_link_or_button( 'click here')
    expect(page).to have_content("Date")
  end

  xit "displays a total number of orders by status type" do
  end

  xit "filters orders to display by status type" do
  end

  xit "link to transition to a different status " do
  end

  xit "displays total for the order" do
    visit orders_path
    expect(page).to have_content("Cost")
  end
end
