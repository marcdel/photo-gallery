require "spec_helper"

describe ApplicationHelper do
  describe 'full_title' do
    it 'should include the page title' do
      full_title('Test').should =~ /Test/
    end

    it 'should include the base title' do
      full_title('Test').should =~ /^Photo Gallery/
    end

    it 'should not include a pipe for the home page' do
      full_title('').should_not =~ /\|/
    end
  end
end