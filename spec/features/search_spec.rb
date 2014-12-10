require 'rails_helper'

context "Searching for tickets" do
  let!(:ticket) { FactoryGirl.create(:ticket) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as!(user)
  end

  it "should correctly fill an issue support request" do

  end

  it "should output an error when a field is not filled in" do

  end
end