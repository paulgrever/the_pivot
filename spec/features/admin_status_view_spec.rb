require 'rails_helper'

RSpec.describe "the admin status view", type: :feature do
  before :each do
    @order = FactoryGirl.create(:order)
    admin = FactoryGirl.create(:admin)
    visit login_path
    fill_in("session_email", with: admin.email)
    fill_in("session_password", with: admin.password)
    click_button 'Sign in'
    visit admin_items_path
  end

  it "displays the total number of complete order statuses" do
    admin = FactoryGirl.create(:admin)
    order = FactoryGirl.create(:order)
    order2 = FactoryGirl.create(:order)
    status = FactoryGirl.create(:status)
    expect(Order.count).to eq(3)
  end

  it "displays the total number of orders" do
    admin = FactoryGirl.create(:admin)
    order = FactoryGirl.create(:order)
    order2 = FactoryGirl.create(:order)
    orders = Order.all
    expect(Order.count).to eq(3)
  end

  it "displays the total number of complete orders" do
    admin = FactoryGirl.create(:admin)
    order = FactoryGirl.create(:order, status_id: 4)
    # order2 = FactoryGirl.create(:order)
    orders = Order.all
    expect(Order.all.order_status == "Completed").to be_valid
  end



end
