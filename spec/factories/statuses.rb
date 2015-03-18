FactoryGirl.define do
  factory :status do
    state "Ordered"
  end

  factory :status2 do
    state "Paid"
  end

  factory :status3 do
    state "Cancelled"
  end

  factory :status4 do
    state "Completed"
  end
end
