require 'rails_helper'

describe Message, :vcr => true do


  it "will create a message" do
    visit new_message_path
    fill_in :To, :with => 'GET_YOUR_OWN_NUMBERS'
    fill_in :From, :with => 'GET_YOUR_OWN_NUMBERS'
    fill_in :Body, :with => 'TESTING IN PROGRESS'
    click_on "Create Message"
    expect(page).to have_content('Your message was sent!')
  end

  it "will sent to multiple numbers" do
    visit new_message_path
    fill_in :To, :with => 'GET_YOUR_OWN_NUMBERS,GET_YOUR_OWN_NUMBERS,GET_YOUR_OWN_NUMBERS'
    fill_in :From, :with => 'GET_YOUR_OWN_NUMBERS'
    fill_in :Body, :with => 'TESTING IN PROGRESS'
    click_on "Create Message"
    expect(page).to have_content('Your message was sent!')
  end

  it "will show individual page for message sent" do
    message = create(:message)
    visit messages_path
    click_link 1
    expect(page).to have_content("1111111111")
  end
end
