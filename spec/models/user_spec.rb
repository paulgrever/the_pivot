require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it 'should be valid without a full name' do
    expect(@user).to be_valid
  end

  it 'should be invalid without a full name' do
    @user.full_name = nil
    expect(@user).not_to be_valid
  end

  it 'should have many orders' do
    expect(@user).to respond_to(:orders)
  end

  it 'should have many items' do
    expect(@user).to respond_to(:items)
  end
end
