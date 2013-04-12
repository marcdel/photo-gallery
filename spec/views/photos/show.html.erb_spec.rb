require "spec_helper"

describe "show Photo page" do
  subject { page }

  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:photo) do
    gallery.photos.build(title: "Test", image: File.new(Rails.root + "spec/factories/rails.png"))
  end

  let(:page_title) { photo.title }
  let(:heading) { photo.title }

  before do
    photo.save
    visit gallery_photo_path(gallery, photo)
  end

  it { should have_selector("title", text: full_title(page_title)) }
  it { should have_selector("h1", text: heading) }

  it { should have_selector("img", src: photo.image.url(:lightbox)) }
end