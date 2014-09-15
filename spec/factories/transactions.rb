FactoryGirl.define do
  factory :transaction do
    sequence(:title) { |n| "Transaction ##{n}" }
    transaction_date { Date.today }
    amount           { 10 }
  end
end
