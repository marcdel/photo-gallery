require 'spec_helper'

describe "About page" do
  subject { page }

  before { visit "/static_pages/about" }

  it "should have content 'About'" do
    should have_content("About")
  end

  it "should have the right title" do
    should have_selector("title", text: "Photo Gallery | About")
  end
end
