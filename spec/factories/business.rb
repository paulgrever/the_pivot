FactoryGirl.define do
  factory :business do
    name "Water merchant"
    description "Water water everywhere and not a drop to drink."
  end

  factory :other_business, class: Business do
    name "Blanket merchants"
    description "Insert creative description here"
  end
end
