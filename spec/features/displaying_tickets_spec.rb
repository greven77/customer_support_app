require 'rails_helper'

context "Displaying tickets" do
  let!(:ticket) { FactoryGirl.create(:ticket) }
  let!(:ticket_on_hold) { FactoryGirl.create(:ticket_on_hold) }
  let!(:ticket_waiting_for_customer) { FactoryGirl.create(:ticket_waiting_for_customer) }
  let!(:ticket_cancelled) { FactoryGirl.create(:ticket_cancelled) }
  let!(:ticket_completed) { FactoryGirl.create(:ticket_completed) }
  let!(:user) { FactoryGirl.create(:user) }


  before do
    sign_in_as!(user)
  end

  it "should see a ticket in new unassigned tickets" do
    click_link 'New unassigned tickets'
    expect(page).to have_content(ticket.reference)
  end

  it "should see a ticket in Open Tickets" do
    click_link 'Open Tickets'
    expect(page).to have_content(ticket_waiting_for_customer.reference)
  end

  it "should see a ticket in On hold tickets" do
    click_link 'On hold tickets'
    expect(page).to have_content(ticket_on_hold.reference)
  end

  it "should see a ticket in On hold tickets" do
    click_link 'On hold tickets'
    expect(page).to have_content(ticket_on_hold.reference)
  end

  it "should see a ticket in Closed Tickets" do
    click_link 'Closed Tickets'
    expect(page).to have_content(ticket_completed.reference)
  end
end