require 'spec_helper'

describe Photo do
  #TODO: https://gist.github.com/marcdel/5361613
  #let(:gallery) { FactoryGirl.create(:gallery_with_photo) }
  #let(:photo) { gallery.photos.first }
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:photo) do
    gallery.photos.build(title: "Test", image: File.new(Rails.root + "spec/factories/rails.png"))
  end

  before do
  end

  subject { photo }

  it { should respond_to(:gallery_id) }
  it { should respond_to(:title) }
  it { should respond_to(:image) }

  it { should be_valid }

  describe "when gallery id is not present" do
    before { photo.gallery_id = nil }

    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { photo.title = " " }

    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { photo.title = "a" * 51 }

    it { should_not be_valid }
  end

  describe "when image is not present" do
    before { photo.image = nil }

    it { should_not be_valid }
  end
end
