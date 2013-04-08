require 'spec_helper'

describe "Edit gallery page" do
  subject { page }

  let(:user) { FactoryGirl.create(:admin) }
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:error_class) { "div.alert.alert-error" }
  let(:save_button) { "Save" }

  before do
    signin user
    gallery.save
    visit edit_gallery_path(gallery)
  end

  #it { should have_selector("title", full_title(gallery.title)) }

  describe "submit with valid information" do
    let(:new_title) { "New Title" }
    let(:new_description) { "New Description" }

    before do
      fill_in "Title", with: new_title
      fill_in "Description", with: new_description
      click_button save_button
    end

    #it { should have_selector("title", full_title(new_title)) }
    #it { should have_selector("h1", new_title) }
    specify { gallery.reload.title.should == new_title }
    specify { gallery.reload.description.should == new_description }
  end

  describe "submit with invalid information" do
    before do
      fill_in "Title", with: ""
      click_button save_button
    end
    it { should have_selector(error_class, text: "error") }
  end
end