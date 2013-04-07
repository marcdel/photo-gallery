require 'spec_helper'

describe "Galleries page" do
  subject { page }

  before { visit galleries_path }
  let(:page_title) { "Galleries" }
  let(:heading) { "Galleries" }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("ul", class: "thumbnails") }
end
