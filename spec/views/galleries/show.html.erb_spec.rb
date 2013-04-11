require 'spec_helper'

describe "Show Gallery page" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:photo) do
    gallery.photos.build(title: "Test", image: File.new(Rails.root + "spec/factories/rails.png"))
  end

  let(:page_title) { gallery.title }
  let(:heading) { gallery.title }

  before do
    photo.save
    visit gallery_path(gallery)
  end

  shared_examples_for "non-admin users" do
    it { should_not have_link("Add Photo", href: new_gallery_photo_path(gallery)) }

    it { should_not have_link("Edit", href: edit_gallery_photo_path(gallery, photo)) }
    it { should_not have_link("Delete", href: gallery_photo_path(gallery, photo)) }
  end

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("ul") }
  it { should have_selector("ul li") }

  it_should_behave_like "non-admin users"
end
