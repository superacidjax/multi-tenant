FactoryGirl.define do
  factory :user, class: Subscribem::User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
  end
end