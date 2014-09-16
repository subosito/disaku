FactoryGirl.define do
  factory :account do
    sequence(:name) { |n| "Account ##{n}" }
    initial_amount  { 10 }

    trait :cash do
      account_type { :cash }
    end

    trait :saving do
      account_type { :saving }
    end

    trait :other do
      account_type { :other }
    end
  end
end
