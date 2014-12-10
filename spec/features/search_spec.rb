require 'rails_helper'

context "Searching for tickets" do
  let!(:ticket) { FactoryGirl.create(:ticket) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as!(user)
  end

  after(:each) do
    click_button "search"
    expect(page).to have_content(ticket.email)
    expect(page).to have_content(ticket.reference)
  end

  it "should display results when user enters a reference as search term" do
    fill_in "keyword", with: ticket.reference
  end

  it "should display results when user enters a subject as search term" do
    fill_in "keyword", with: ticket.subject
  end

  it "should display results when user enters a word contained in an issue" do
    random_part = ticket.issue.split(" ")[rand(30)]
    fill_in "keyword", with: random_part
  end
end