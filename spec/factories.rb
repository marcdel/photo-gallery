FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com"}
    password 'password'
    password_confirmation 'password'
  end
end