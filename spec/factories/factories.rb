FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end

  factory :gallery do
    sequence(:title) { |n| "Gallery #{n}" }
    sequence(:description) { |n| "Description of gallery #{n}" }
    cover File.new(Rails.root + "spec/factories/rails.png")

    factory :gallery_with_photo do
      after_create do |gallery|
        create(:photo, gallery: gallery)
      end
    end
  end

  factory :photo do
    sequence(:title) { |n| "Gallery #{n}" }
    image File.new(Rails.root + "spec/factories/rails.png")
  end

  factory :print do
    sequence(:width) { |n| n }
    sequence(:height) { |n| n }
    print_type "Test"
    sequence(:price) { |n| n }
  end
end