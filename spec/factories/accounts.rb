FactoryGirl.define do
  factory :account do
    name { Forgery(:lorem_ipsum).word(random: true).titleize }
  end
end
