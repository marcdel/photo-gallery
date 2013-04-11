require 'spec_helper'

describe Gallery do
  let(:gallery) { FactoryGirl.create(:gallery) }

  before do
  end

  subject { gallery }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:cover) }
  it { should respond_to(:photos) }

  it { should be_valid }

  describe "when title is not present" do
    before { gallery.title = " " }

    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { gallery.title = "a" * 51 }

    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { gallery.description = "a" * 501 }

    it { should_not be_valid }
  end

  describe "when cover is not present" do
    before { gallery.cover = nil }

    it { should_not be_valid }
  end
end
