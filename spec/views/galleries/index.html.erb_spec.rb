require 'spec_helper'

describe "Galleries page" do
  subject { page }

  let(:page_title) { "Galleries" }
  let(:heading) { "Galleries" }
  let(:user) { FactoryGirl.create(:user) }
  let(:gallery) { FactoryGirl.create(:gallery) }

  before do
    gallery.save
    visit galleries_path
  end

  shared_examples_for "non-admin users" do
    it { should_not have_link("Add Gallery", href: new_gallery_path) }

    it { should_not have_link("Edit") }
    it { should_not have_link("Delete") }
  end

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("ul") }
  it { should have_selector("ul li") }

  it_should_behave_like "non-admin users"

  describe "as a logged in user" do
    before do
      signin_user(user)
      visit galleries_path
    end

    it_should_behave_like "non-admin users"
  end

  describe "as a logged in admin user" do
      before do
        signin_admin_user(user)
        visit galleries_path
      end

      it { should have_link("Add Gallery", href: new_gallery_path) }

      it { should have_link("Edit") }
      it { should have_link("Delete") }
  end
end