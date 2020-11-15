FactoryBot.define do
  factory :account  do
    sequence(:todo_id) { 1 }
    sequence(:amount) { 200 }
  end
end