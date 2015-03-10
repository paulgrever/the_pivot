require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { User.create(email: 'lori@lori.com', full_name: 'Lori C', password: 'lori') }
  let(:invalid_user) { User.create(email: 'lori@lori.com', password: 'lori') }

  it 'should be valid without a full name' do
    expect(valid_user).to be_valid
  end

  it 'should be invalid without a full name' do
    expect(invalid_user).not_to be_valid
  end

  it 'should have many orders' do
    expect(valid_user).to respond_to(:orders)
  end

  it 'should have many items' do
    expect(valid_user).to respond_to(:items)
  end
end
