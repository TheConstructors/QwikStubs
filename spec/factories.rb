FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "Santa Barbara Bowl#{n}" }
    city "Santa Barbara"
    state "CA"
  end
end
