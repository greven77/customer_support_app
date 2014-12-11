require 'rails_helper'

context "Customer updating tickets" do
  let!(:ticket) { FactoryGirl.create(:ticket_on_hold) }

  before(:each) do
    visit "/tickets/#{ticket.reference}/history"
  end

  it "should correctly fill an issue support request" do
    fill_in "Department", with: 'IT'
    fill_in 'Issue', with: 'I got a fever and the only prescription is more cowbell '
    click_button "Submit ticket"

    expect(page).to have_content("Ticket has been updated.")
  end

  it "should output an error when a field is not filled in" do
    fill_in "Department", with: ''
    click_button "Submit ticket"

    expect(page).to have_content("Ticket has not been updated.")
  end
end