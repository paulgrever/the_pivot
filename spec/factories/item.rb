FactoryGirl.define do
  factory :item do
    title "Water bottle"
    description "What holy water contains a little drop, little drop for me?"
    price 2
  end

  factory :item2, class: Item do
    title "Food package"
    description "pre-packaged, proteined-packed"
    price 10
  end
end
