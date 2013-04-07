require 'spec_helper'

describe "Home page" do

  it "should have the content 'Photo Gallery'" do
    visit root_path
    page.should have_content('Photo Gallery')
  end

end