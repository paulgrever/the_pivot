FactoryGirl.define do
  factory :business do
    name "Water merchant"
    description "Water water everywhere and not a drop to drink."
    user
  end

 factory :other_business, class: Business do
    name "Blanket merchants"
    description "Insert creative description here"
    user
  end
end
