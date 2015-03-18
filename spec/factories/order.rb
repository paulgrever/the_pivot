FactoryGirl.define do
  factory :order do
    user
    status

    before :create do
      create :user
    end

    before :create do
      create :status
    end
  end

  factory :order2, class: Order do
    user
    status
    
    before :create do
      create :user
    end

    before :create do
      create :status
    end
  end
end