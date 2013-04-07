require 'spec_helper'

describe "About page" do
  it "should have content 'About'" do
    visit '/static_pages/about'
    page.should have_content('About')
  end
end
