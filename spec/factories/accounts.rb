FactoryGirl.define do
  factory :account do
    sequence(:name) { |n| "Account ##{n}" }
    initial_amount  { 10 }
  end
end
