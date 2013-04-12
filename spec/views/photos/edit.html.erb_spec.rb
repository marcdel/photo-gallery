require "spec_helper"

describe "Edit photo page" do
  subject { page }

  let(:error_class) { "div.alert.alert-error" }
  let(:save_button) { "Save" }
  let(:admin_user) { FactoryGirl.create(:admin) }
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:photo) do
    gallery.photos.build(title: "Test", image: File.new(Rails.root + "spec/factories/rails.png"))
  end

  before do
    signin(admin_user)
    gallery.save
    photo.save
    visit edit_gallery_photo_path(gallery, photo)
  end

  #it { should have_selector("title", full_title(photo.title)) }
  #it "should have the correct title" do
  #  find("title").native.text
  #  page.should have_selector("title", full_title(photo.title))
  #end

  describe "submit with valid information" do
    let(:new_title) { "New Title" }
    let(:new_description) { "New Description" }

    before do
      fill_in "Title", with: new_title
      click_button save_button
    end

    #it { should have_selector("title", full_title(new_title)) }
    #it { should have_selector("h1", new_title) }
    specify { photo.reload.title.should == new_title }
  end

  describe "submit with invalid information" do
    before do
      fill_in "Title", with: ""
      click_button save_button
    end
    it { should have_selector(error_class, text: "error") }
  end
end