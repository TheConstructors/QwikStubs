FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "Santa Barbara Bowl#{n}" }
    city "Santa Barbara"
    state "CA"
  end

  factory :user do
    sequence(:full_name) { |n| "John Smith#{n}" }
    password "secrete"
  end

  factory :email do
    sequence(:email) { |n| "example#{n}@qwikstubs.com" }
    user
  end
end
