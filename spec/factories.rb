FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "Santa Barbara Bowl#{n}" }
    city "Santa Barbara"
    state "CA"
  end

  factory :event do
    sequence(:name) { |n| "Brittany's super cool show#{n}!" }
    month "Feb"
    day "28"
    year "2014"
    description "It's Awesome!"
    time "1:00pm"
    venue
    promoter
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
  
  factory :promoter_membership do
    user
    promoter
    role "admin"
  end

  factory :venue_membership do
    venue
    promoter
    role "manager"
  end

end
