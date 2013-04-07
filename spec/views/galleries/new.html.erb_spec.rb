require 'spec_helper'

describe "New gallery page" do
  subject { page }

  let(:page_title) { "New Gallery" }
  let(:heading) { "New Gallery" }

  before { visit new_gallery_path }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  describe "submit with invalid information" do

  end

  describe "submit with valid information" do

  end
end
