FactoryGirl.define do
  require 'date'
  
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
    #date Date.new(2014, 2, 28)
    description "It's Awesome!"
    time "1:00pm"
    venue
    promoter
  end
  
  factory :event_seat do
    event_section
    seat
    row 0 
    column 0
    status EventSeat::Status::UNSOLD
  end
  
  factory :event_section do
    event
    section
    price 89.99
  end

  factory :section do
    sequence(:name) { |n| "1#{n}A" }
    venue
  end

  factory :seat do
    sequence(:name) { |n| "1#{n}A" }
    sequence(:row) { |n| n }  
    sequence(:column) { |n| n }
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
    sequence(:name) { |n| "Alex Hamstra Inc.#{n}" }
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
  
  factory :billing_info do
    user
    sequence (:full_name) { |n| "Bob Barker#{n}" }
    sequence (:ccn) { |n| "1234 1234 1234 123#{n}" }
    sequence (:address) { |n| "123#{n} Wallaby Way" }
    city "Los Angeles"
    state "CA"
    zip "91601"
    verified true
  end
  
  factory :order do
    billing_info
    sequence(:order_number) { |n| n }
    total_amount 156.10
  end

  factory :group do
    size 0
    event 
  end
end
