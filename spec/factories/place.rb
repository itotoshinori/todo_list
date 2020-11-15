FactoryBot.define do
  factory :place do
    sequence(:code) { "1" }
    sequence(:name) { "北海道" }
  end
end