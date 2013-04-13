require 'spec_helper'

describe Print do
  let(:print) { FactoryGirl.create(:print) }

  subject { print }

  it { should respond_to :width }
  it { should respond_to :height }
  it { should respond_to :print_type }
  it { should respond_to :price }

  it { should be_valid }

  describe "when width is 0" do
    before { print.width = 0 }
    it { should_not be_valid }
  end

  describe "when width is negative" do
    before { print.width = -1 }
    it { should_not be_valid }
  end

  describe "when width is non-numeric" do
    before { print.width = " " }
    it { should_not be_valid }
  end

  describe "when height is 0" do
    before { print.height = 0 }
    it { should_not be_valid }
  end

  describe "when height is negative" do
    before { print.height = -1 }
    it { should_not be_valid }
  end

  describe "when height is non-numeric" do
    before { print.height = " " }
    it { should_not be_valid }
  end

  describe "when price is 0" do
    before { print.price = 0 }
    it { should_not be_valid }
  end

  describe "when price is negative" do
    before { print.price = -1 }
    it {should_not be_valid  }
  end

  describe "when price is non-numeric" do
    before { print.price = " " }
    it { should_not be_valid }
  end

  describe "when type is too long" do
    before { print.print_type = "a" * 51 }
    it { should_not be_valid }
  end
end
