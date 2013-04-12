require "spec_helper"

describe "New Photo page" do
  subject { page }

  let(:page_title) { "New Photo" }
  let(:heading) { "New Photo" }
  let(:save_button) { "Save" }
  let(:error_class) { "div.alert.alert-error" }
  let(:gallery) { FactoryGirl.create(:gallery) }

  before { visit new_gallery_photo_path(gallery) }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  describe "submit with invalid information" do
    it "should not create a new photo" do
      expect { click_button save_button }.not_to change(Photo, :count)
    end

    describe "error message" do
      before { click_button save_button }
      it { should have_selector(error_class, text: "error") }
    end
  end

  describe "submit with valid information" do
    before do
      fill_in "Title", with: "Test title"
      attach_file("Image", Rails.root + 'spec/factories/rails.png')
    end

    it "should create a new photo" do
      expect { click_button save_button }.to change(Photo, :count).by(1)
    end
  end
end
