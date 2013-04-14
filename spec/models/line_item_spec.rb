require 'spec_helper'

describe LineItem do
  let(:cart) { FactoryGirl.create(:cart) }
    let(:gallery) { FactoryGirl.create(:gallery) }
    let(:photo) { FactoryGirl.create(:photo, gallery: gallery) }
    let(:print) { FactoryGirl.create(:print) }
    let(:photo_print) { FactoryGirl.create(:photo_print, photo: photo, print: print) }
  let(:line_item) { FactoryGirl.build(:line_item, cart: cart, photo_print: photo_print) }

  subject { line_item }

  it { should be_valid }

  it{ should respond_to(:cart_id) }
  it{ should respond_to(:price) }
  it{ should respond_to(:photo_print_id) }
  it{ should respond_to(:quantity) }

  describe "total price" do
    before do
      line_item.quantity = 2
    end

    it "should have the correct total price" do
      expect do
        line_item.total_price == line_item.price * line_item.quantity
      end
    end
  end
end
