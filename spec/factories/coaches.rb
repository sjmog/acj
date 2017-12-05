FactoryBot.define do
  sequence :email { |n| "coach#{n}@makersacademy.com" }
  factory :coach do
    email
    password 'password123'
  end
end