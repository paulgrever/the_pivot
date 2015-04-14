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
    item = create(:item)
    order = create(:order, user_id: @user.id)
    create(:order_item,
           item_id: item.id,
           order_id: order.id)
    expect(@user.previously_order_items.first.title).to eq(item.title)
  end

  describe "User roles" do
    context "A new user" do
      let(:new_user) do
        User.create(full_name: "New user", password: "password")
      end

      it "is not an admin" do
        expect(new_user.admin?).to eq(false)
      end

      it "is not an business owner" do
        expect(new_user.business_owner?).to eq(false)
      end

      it "can be made an admin" do
        new_user.make_admin
        expect(new_user.admin?).to eq(true)
      end

      it "can be made an business_owner" do
        new_user.make_business_owner
        expect(new_user.business_owner?).to eq(true)
      end

      it "cannot be a business_owner and become and admin" do
        new_user.make_business_owner
        new_user.make_admin
        expect(new_user.admin?).to eq(false)
      end

      it "cannot be an admin and become a business_owner" do
        new_user.make_admin
        new_user.make_business_owner
        expect(new_user.business_owner?).to eq(false)
      end
    end
  end
end
