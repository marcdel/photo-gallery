require 'spec_helper'

describe PhotoPrint do
  let(:gallery) { FactoryGirl.create(:gallery) }
  let(:photo) { FactoryGirl.create(:photo, gallery: gallery) }
  let(:print) { FactoryGirl.create(:print) }
  let(:photo_print) { photo.photo_prints.build(print_id: print.id) }

  subject { photo_print }

  it { should be_valid }

  it { should respond_to(:photo) }
  it { should respond_to(:print) }
  its(:photo) { should == photo }
  its(:print) { should == print }

  describe "when photo id is not present" do
    before { photo_print.photo_id = nil }
    it { should_not be_valid }
  end

  describe "when print id is not present" do
    before { photo_print.print_id = nil }
    it { should_not be_valid }
  end
end
