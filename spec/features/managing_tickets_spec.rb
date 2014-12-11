require 'rails_helper'

context "Managing tickets" do
  let!(:ticket_on_hold) { FactoryGirl.create(:ticket_on_hold) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ticket) { FactoryGirl.create(:ticket) }
  let!(:status_on_hold) { FactoryGirl.create(:status_on_hold) }
  let!(:status_waiting_for_customer) { FactoryGirl.create(:status_waiting_for_customer) }

  before do
    sign_in_as!(user)
    click_link 'On hold tickets'
    click_link 'Reply'
  end

  after(:each) do
    expect(page).to have_content("Ticket has been updated.")
  end

  it "should change owner" do
    select "user1", :from => "ticket_user_id"
    click_button 'Update Ticket'
    expect(page).to have_content("user1")
  end

  it "should change status" do
    select "Waiting for Customer", :from => "ticket_status"
    click_button 'Update Ticket'
    expect(page).to have_content("Waiting for Customer")
  end

  it "should send reply" do
    fill_in 'Reply Subject', :with => 'Hello'
    fill_in 'Reply Message', :with => 'Hello World'
    click_button 'Update Ticket'
    expect(page).to have_content("Hello")
    expect(page).to have_content("Hello World")
  end
end