FactoryBot.define do
  factory :article do
    title Faker::Markdown.headers
    body Faker::Markdown.sandwich(6,4)
    association :user, factory: :user
  end
end