require "rails_helper"

describe "the default users order view", type: :feature do

  before :each do
    @user = FactoryGirl.create(:user)
    @status = FactoryGirl.create(:status)
    @order = FactoryGirl.create(:order, user_id: @user.id, status: @status)
    @order2 = FactoryGirl.create(:order, status: @status)
    visit root_path
    within("#signInModal") do
      fill_in("session_email", with: "paullorijgu@gmail.com")
      fill_in("session_password", with: "gu")
      click_button "Sign in"
    end
    visit orders_path
  end

  it "displays all the orders on the index page" do
    expect(page).to have_content("My Orders")
  end

  it "displays links for each individual order if there are orders" do
    expect(page).to have_content("Details")
  end

  it "shows each orders indivdual information" do
    within("table tr:nth-child(2)") do
      click_link_or_button("Details")
    end
    expect(page).to have_content("Details for Order ID:")
  end

  it "displays the order status" do
    expect(page).to have_content(@order.order_status)
  end

  it "displays order date" do
    click_link_or_button("Details")
    expect(page).to have_content(@order.date)
  end
end
