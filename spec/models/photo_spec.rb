require "spec_helper"

describe Photo do
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:print) { FactoryGirl.create(:print) }
  let(:photo) { FactoryGirl.create(:photo, gallery: gallery) }

  before do
    photo.photo_prints.build(print_id: print.id)
  end

  subject { photo }

  it { should respond_to(:gallery_id) }
  it { should respond_to(:title) }
  it { should respond_to(:image) }
  it { should respond_to(:photo_prints) }

  it { should be_valid }

  describe "gallery photo relationship" do
    it "should belong to gallery" do
      expect { photo.gallery_id == gallery.id }
      expect { photo.gallery == gallery }
    end
  end

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
