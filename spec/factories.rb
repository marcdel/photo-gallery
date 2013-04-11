FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com"}
    password 'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end

  factory :gallery do
    sequence(:title) { |n| "Gallery #{n}" }
    sequence(:description) { |n| "Description of gallery #{n}" }
  end

  factory :photo do
    sequence(:title) { |n| "Gallery #{n}" }
  end
end