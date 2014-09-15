FactoryGirl.define do
  factory :transfer do
    sequence(:title) { |n| "Transfer ##{n}" }
    transfer_date    { Date.today }
    amount           { 10 }
  end
end
