FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "Santa Barbara Bowl#{n}" }
    city "Santa Barbara"
    state "CA"
  end

  factory :section do
    sequence(:name) { |n| "1#{n}A" }
    venue
  end

  factory :seat do
    sequence(:name) { |n| "1#{n}A" }
    row "A" 
    sequence(:column) { |n| "1#{n}" }
    section
  end

  factory :user do
    sequence(:full_name) { |n| "John Smith#{n}" }
    password "secrete"
  end

  factory :email do
    sequence(:email) { |n| "example#{n}@qwikstubs.com" }
    user
  end

  factory :promoter do
    sequence(:name) { |n| "Alex Hamstra Inc.#{n}"}
    verified true
  end

end
