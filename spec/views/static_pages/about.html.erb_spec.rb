require "spec_helper"

describe "About page" do
  subject { page }

  before { visit about_path }

  let(:page_title) { "About" }
  let(:heading) { "About" }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }
end
