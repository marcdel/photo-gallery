require 'spec_helper'

describe "Help page" do
  subject { page }

  before { visit '/static_pages/help' }
  let(:page_title) { "Help" }
  let(:heading) { "Help" }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }
end
