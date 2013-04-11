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
end
