FactoryGirl.define do
  factory :order do
    user_id 3
    status_id 2
  end

  factory :order2, class: Order do
    user_id 2
    status_id 1
  end
end
