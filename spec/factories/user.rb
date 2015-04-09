FactoryGirl.define do
  factory :user do
    email "default.user@mail.com"
    full_name "Default user"
    password "password"
  end

  factory :admin, class: User do
    email "admin@gmail.com"
    full_name  "Admin man"
    password "admin"
    role "admin"
  end

  factory :business_owner, class: User do
    email "business.owner@gmail.com"
    full_name "Jane Smith"
    password "password"
    role "business_admin"
  end

  factory :business_owner2, class: User do
    email "business.owner-2@gmail.com"
    full_name "Richard Mejia"
    password "password"
    role "business_admin"
  end
end
