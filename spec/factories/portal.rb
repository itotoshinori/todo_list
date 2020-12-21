FactoryBot.define do
  factory :portal do
    sequence(:title) { "テスト" }
    sequence(:content) { "北海道" }
  end
end
