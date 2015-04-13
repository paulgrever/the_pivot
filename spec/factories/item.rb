FactoryGirl.define do
  factory :item do
    title "Water bottle"
    description "What holy water contains a little drop, little drop for me?"
    price 200
  end

  factory :item2, class: Item do
    title "Food package"
    description "pre-packaged, proteined-packed"
    price 1099
  end
end
