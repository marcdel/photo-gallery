require 'spec_helper'

describe "Contact page" do
  subject { page }

  before { visit "/static_pages/contact" }

  it "should have content 'Contact'" do
    should have_content("Contact")
  end

  it "should have the right title" do
    should have_selector("title", text: "Photo Gallery | Contact")
  end
end