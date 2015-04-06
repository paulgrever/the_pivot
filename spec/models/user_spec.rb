require "rails_helper"

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "should be valid without a full name" do
    expect(@user).to be_valid
  end

  it "should be invalid without a full name" do
    @user.full_name = nil
    expect(@user).not_to be_valid
  end

  it "should have many orders" do
    expect(@user).to respond_to(:orders)
  end

  it "should have many items" do
    expect(@user).to respond_to(:items)
  end

  it "it displays placed orders for user" do
    item = FactoryGirl.create(:item)
    order = FactoryGirl.create(:order, user_id: @user.id)
    order_item = FactoryGirl.create(:order_item,
                                    item_id: item.id,
                                    order_id: order.id)
    order = FactoryGirl.create(:order, user_id: @user.id)
    expect(@user.previously_order_items.first.title).to eq(item.title)
  end
end
