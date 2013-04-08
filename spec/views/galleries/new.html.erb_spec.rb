require 'spec_helper'

describe "New gallery page" do
  subject { page }

  let(:page_title) { "New Gallery" }
  let(:heading) { "New Gallery" }
  let(:create_button) { "Create" }
  let(:error_class) { "div.alert.alert-error" }

  before { visit new_gallery_path }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  describe "submit with invalid information" do
    it "should not create a new gallery" do
      expect { click_button create_button }.not_to change(Gallery, :count)
    end

    describe "error messages" do
      before { click_button create_button }
      it { should have_selector(error_class, text: "error") }
    end
  end

  describe "submit with valid information" do
    before{ fill_in "Title", with: "Test title" }

    it "should create a new gallery" do
      expect { click_button create_button }.to change(Gallery, :count).by(1)
    end
  end
end
