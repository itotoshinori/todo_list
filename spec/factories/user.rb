FactoryBot.define do
  factory :user do
    sequence(:email) { "TEST1234@example.com" }
    sequence(:password) { "password" }
    sequence(:name) { "山田" }
  end
end
