FactoryBot.define do
  factory :blog do
    sequence(:title) { "テスト" }
    sequence(:content) { "テスト投稿" }
  end
end