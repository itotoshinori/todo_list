FactoryBot.define do
  factory :user do
    sequence(:email) { "TEST1234@example.com" }
    sequence(:password) { "1234567" }
    sequence(:name) { "山田" }
  end
end
