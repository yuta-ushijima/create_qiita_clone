FactoryBot.define do
  factory :article do
    title Faker::Markdown.headers
    body Faker::Markdown.sandwich(6,4)
    association :user, factory: :user
  end

  factory :nil_title do
    title nil
    body "body!"
    association :user, factory: :user
  end

  factory :nil_body do
    title "title!"
    body nil
    association :user, factory: :user
  end
end