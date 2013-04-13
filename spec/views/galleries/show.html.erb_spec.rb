require "spec_helper"

describe "Show Gallery page" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:photo) do
    gallery.photos.build(title: "Test", image: File.new(Rails.root + "spec/factories/rails.png"))
  end

  let(:page_title) { gallery.title }
  let(:heading) { gallery.title }

  before do
    photo.save
    visit gallery_path(gallery)
  end

  shared_examples_for "gallery#show non-admin users" do
    it { should_not have_link("Add Photo", href: new_gallery_photo_path(gallery)) }

    it { should_not have_link("Edit", href: edit_gallery_photo_path(gallery, photo)) }
    it { should_not have_link("Delete", href: gallery_photo_path(gallery, photo)) }
  end

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("ul") }
  it { should have_selector("ul li") }

  it_should_behave_like "gallery#show non-admin users"

  describe "photo pagination" do
    before(:all) do
      12.times do |n|
        test_photo = gallery.photos.build(title: "Test#{n}", image: File.new(Rails.root + "spec/factories/rails.png"))
        test_photo.save
      end
    end
    after(:all) { Photo.delete_all }

    it { should have_selector("div.pagination") }

    it "should show each photo" do
      Photo.paginate(page: 1, per_page: 6).each do |photo|
        page.should have_selector("img", src: photo.image.url(:thumb))
      end
    end
  end

  describe "as a logged in user" do
    before do
      signin(user)
      visit gallery_path(gallery)
    end

    it_should_behave_like "gallery#show non-admin users"
  end

  describe "as a logged in admin user" do
    before do
      user.toggle!(:admin)
      signin(user)
      visit gallery_path(gallery)
    end

    it { should have_link("Add Photo", href: new_gallery_photo_path(gallery)) }

    it { should have_link("Edit", href: edit_gallery_photo_path(gallery, photo)) }
    it { should have_link("Delete", href: gallery_photo_path(gallery, photo)) }

    describe "delete photo clicked" do
      it "should delete the photo" do
        expect { click_link "Delete" }.to change(Photo, :count).by(-1)
      end
    end
  end
end
