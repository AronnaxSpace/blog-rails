FactoryBot.define do
  factory :post do
    content { FFaker::Lorem.paragraph }

    trait :with_title do
      title { FFaker::Lorem.sentence }
    end
  end
end
