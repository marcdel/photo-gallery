require 'spec_helper'

describe "Home page" do
  subject { page }

  before { visit root_path }
  let(:page_title) { "Photo Gallery" }

  it "should have the content 'Photo Gallery'" do
    should have_content("Photo Gallery")
  end

  it "should have the right title" do
    should have_selector("title", text: "Photo Gallery")
  end
end