require 'spec_helper'

describe "Show Gallery page" do
  subject { page }

  let(:page_title) { "Gallery" }
  let(:heading) { "Gallery" }
  let(:user) { FactoryGirl.create(:user) }
  let(:gallery) { FactoryGirl.create(:gallery) }
end
