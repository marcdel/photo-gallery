require 'spec_helper'

describe User do
  before do
    @user = User.new(email: "user@email.com", name: "Test User")
  end

  subject { @user }


end