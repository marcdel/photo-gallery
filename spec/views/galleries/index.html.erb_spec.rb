require 'spec_helper'

describe "Galleries page" do
  subject { page }

  before { visit galleries_path }
  let(:page_title) { "Galleries" }
  let(:heading) { "Galleries" }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("ul", class: "thumbnails") }
  it { should_not have_link("Add Gallery", href: "#") }

  describe "as an admin user" do
    before do
      let(:user) { FactoryGirl.create(:user) }

      before do
        user.toggle!(:admin)
        signin_admin_user(user)

        visit galleries_path
      end

      it { should have_link("Add Gallery", href: "#") }
    end


  end
end