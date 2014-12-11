require 'rails_helper'

context "Status management access" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin)}

  it "does not display Managing Statuses link to staff" do
    sign_in_as!(user)
    expect(page).not_to have_content("Manage Statuses")
  end

  it "Display Managing Statuses link to staff" do
    sign_in_as!(admin)
    expect(page).to have_content("Manage Statuses")
  end
end

context "CRUD Operations on statuses" do
  let!(:admin) { FactoryGirl.create(:admin)}

  before do
    sign_in_as!(admin)
    click_link "Manage Statuses"
    click_link 'Create New Status'
    fill_in 'Description', with: "Hello"
    click_button 'Create Status'
    expect(page).to have_content("Status successfully created.")
  end

  it "should update a status" do
    click_link 'edit_hello'
    fill_in 'Description', with: "Hello World"
    click_button 'Update Status'
    expect(page).to have_content("Status has been updated.")
    expect(page).to have_content("Hello World")
  end

  it "delete a status" do
    click_link 'delete_hello'
    expect(page).to have_content("Status has been deleted.")
    expect(page).not_to have_content("Hello")
  end
end