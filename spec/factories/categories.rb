FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category ##{n}" }

    trait :expense do
      category_type { :expense }
    end

    trait :income do
      category_type { :income }
    end

    trait :credit do
      category_type { :credit }
    end
  end
end
