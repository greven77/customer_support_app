require 'rails_helper'

context "Creating a ticket" do
  before(:each) do
    visit "/"
    fill_in "Name", with: 'Antonio Pacheco'
    fill_in "Email", with: 'antonio@antonio.pt'
  end

  it "should correctly fill an issue support request" do
    fill_in "Department", with: 'Billing'
    fill_in 'Issue', with: 'I got a fever and the only prescription is more cowbell '
    click_button "Submit ticket"

    expect(page).to have_content("Ticket successfully sent, please check your email.")
  end

  it "should output an error when a field is not filled in" do
    click_button "Submit ticket"

    expect(page).to have_content("Ticket has not been created.")
  end
end