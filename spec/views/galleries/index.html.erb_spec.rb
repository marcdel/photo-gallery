require "spec_helper"

describe "Galleries page" do
  subject { page }

  let(:page_title) { "Galleries" }
  let(:heading) { "Galleries" }
  let(:user) { FactoryGirl.create(:user) }
  let(:gallery) { FactoryGirl.create(:gallery) }

  before do
    gallery.save
    visit galleries_path
  end

  shared_examples_for "gallery#index non-admin users" do
    it { should_not have_link("Add Gallery", href: new_gallery_path) }

    it { should_not have_link("Edit") }
    it { should_not have_link("Delete") }
  end

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("ul") }
  it { should have_selector("ul li") }

  it_should_behave_like "gallery#index non-admin users"

  describe "gallery pagination" do
    before(:all) { 12.times { FactoryGirl.create(:gallery) } }
    after(:all) { Gallery.delete_all }

    it { should have_selector("div.pagination") }

    it "should show each gallery" do
      Gallery.paginate(page: 1, per_page: 6).each do |gallery|
        page.should have_selector("a", text: gallery.title)
        page.should have_selector("img", src: gallery.cover.url(:thumb))
      end
    end
  end

  describe "as a logged in user" do
    before do
      signin(user)
      visit galleries_path
    end

    it_should_behave_like "gallery#index non-admin users"
  end

  describe "as a logged in admin user" do
      before do
        user.toggle!(:admin)
        signin(user)
        visit galleries_path
      end

      it { should have_link("Add Gallery", href: new_gallery_path) }

      it { should have_link("Edit"), href: edit_gallery_path(gallery) }
      it { should have_link("Delete"), href: gallery_path(gallery) }

      describe "delete gallery clicked" do
        it "should delete the gallery" do
          expect { click_link "Delete" }.to change(Gallery, :count).by(-1)
        end
      end
  end
end