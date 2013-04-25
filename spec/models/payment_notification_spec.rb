require 'spec_helper'

describe PaymentNotification do
  it 'should be valid' do
    PaymentNotification.new.should be_valid
  end
end
