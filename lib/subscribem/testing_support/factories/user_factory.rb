require 'subscribem/testing_support/factories/user_factory'

FactoryGirl.define do
  factory :user, class: Subscribem::User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
  end
end