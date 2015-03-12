require 'rails_helper'

RSpec.describe Status, type: :model do
  it 'should have many orders' do
    status = FactoryGirl.create(:status)
    expect(status).to respond_to(:orders)
  end
end
