FactoryGirl.define do
  factory :user do
    email "default.user@mail.com"
    full_name  "Default user"
    password "password"
    role "default"
    provider "twitter"
    uid "abc123"
  end

  factory :admin, class: User do
    email "admin@gmail.com"
    full_name  "Admin man"
    display_name "jguish"
    password "admin"
    role "admin"
    provider "twitter"
    uid "abc123"
  end

  factory :business_owner, class: User do
    email "admin@gmail.com"
    full_name "Jane Smith"
    display_name "JaneS"
    password "password"
    role "business_admin"
    provider "twitter"
    uid "abc123"
  end
end
