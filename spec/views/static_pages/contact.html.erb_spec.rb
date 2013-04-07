require 'spec_helper'

describe "Contact page" do
  it "should have content 'Contact'" do
    visit '/static_pages/contact'
    page.should have_content('Contact')
  end
end