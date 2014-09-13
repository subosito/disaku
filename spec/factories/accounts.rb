FactoryGirl.define do
  sequence :name do |n|
    "Account ##{n}"
  end

  factory :account do
    name
    initial_amount { 10 }
  end
end
