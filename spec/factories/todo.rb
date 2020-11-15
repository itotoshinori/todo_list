FactoryBot.define do
  factory :todo do
    sequence(:title) { "テスト" }
    sequence(:term) { 2021-10-10 }
    sequence(:user_id) { 1 }
  end
end