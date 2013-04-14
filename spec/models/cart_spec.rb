require 'spec_helper'

describe Cart do
  let(:cart) { FactoryGirl.create(:cart) }
  let(:print) { FactoryGirl.create(:print) }

  subject { cart }

  it { should be_valid }

  it { should respond_to(:purchased_at) }
  it { should respond_to(:line_items) }

  describe "total price" do
    before do
      10.times { FactoryGirl.create(:line_item, cart: cart, print: print, price: 2, quantity: 2) }
    end

    it "should have the correct total price" do
      calculated_total = cart.line_items.to_a.sum(&:total_price)
      expect(cart.total_price).to eq(calculated_total)
    end
  end
end
