# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string(255)
#

FactoryBot.define do
  factory :article do
    title { Faker::Markdown.headers }
    body { Faker::Markdown.sandwich(6, 4) }
    association :user, factory: :user
    status { :published }
  end
end
