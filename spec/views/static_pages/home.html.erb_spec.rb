require 'spec_helper'

describe "Home page" do
  subject { page }

  before { visit root_path }
  let(:page_title) { "" }
  let(:heading) { "Photo Gallery" }

  it { should have_selector("h1",    text: heading) }
  it { should have_selector("title", text: full_title(page_title)) }
  it { should_not have_selector "title", text: "| Home" }
end