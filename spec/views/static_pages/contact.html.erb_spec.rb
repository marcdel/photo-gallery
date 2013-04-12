require "spec_helper"

describe "Contact page" do
  subject { page }

  before { visit contact_path }

  let(:page_title) { "Contact" }
  let(:heading) { "Contact" }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }
end