require "spec_helper"

describe "Sign in page" do
  subject { page }

  let(:page_title) { "Sign In" }
  let(:heading) { "Sign In" }
  let(:signin_link) { "Sign In" }
  let(:signout_link) { "Sign Out" }
  let(:error_class) { "div.alert.alert-error" }

  before { visit signin_path }

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  describe "submit with invalid information" do
    before { click_button signin_link }

    it { should have_selector("title", text: full_title(page_title)) }
    it { should have_selector(error_class, text: "Invalid") }

    describe "after visiting another page" do
      before { click_link "Home" }
      it { should_not have_selector(error_class, text: "Invalid") }
    end
  end

  describe "submit with valid information" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      fill_in "Email", with: user.email.upcase
      fill_in "Password", with: user.password
      click_button signin_link
    end

    it { should have_selector("title", text: full_title("")) }
    it { should have_link(signout_link, href: signout_path) }
    it { should_not have_link(signin_link, href: signin_path) }

    describe "followed by sign out" do
      before { click_link signout_link }
      it { should have_link(signin_link, href: signin_path) }
    end
  end
end