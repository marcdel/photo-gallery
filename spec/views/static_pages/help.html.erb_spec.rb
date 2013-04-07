require 'spec_helper'

describe "Help page" do
  subject { page }

  before { visit '/static_pages/help' }

  it "should have content 'Help'" do
    should have_content('Help')
  end

  it "should have the right title" do
    should have_selector('title', text: "Photo Gallery | Help")
  end
end
