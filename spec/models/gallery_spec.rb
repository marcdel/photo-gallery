require 'spec_helper'

describe Gallery do
  before do
    @gallery = Gallery.new(title: "Title")
  end

  subject { @gallery }

  it{ should respond_to(:title) }
  it{ should respond_to(:description) }
end
