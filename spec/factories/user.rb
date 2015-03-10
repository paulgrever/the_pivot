FactoryGirl.define do
  factory :user do
    email "paullorijgu@gmail.com"
    full_name  "Laul Guberson"
    password "gu"
    role "default"
  end

  factory :admin, class: User do
    email "admin@gmail.com"
    full_name  "Admin man"
    password "admin"
    role "admin"
  end
end
