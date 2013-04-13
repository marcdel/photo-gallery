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
      after(:build) do |gallery|
        build(:photo, gallery: gallery)
      end
      after(:create) do |gallery|
        gallery.photos.each { |photo| photo.save }
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
    sequence(:price) { |n| n }
  end

  factory :photo_print do

  end
end