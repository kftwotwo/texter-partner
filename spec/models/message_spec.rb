require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
    expect(message.save).to eq false
  end

  it "add an error if the number is not validated" do
   message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
   message.save
   expect(message.errors.messages[:base]).to eq ["The 'From' number 5039463641 is not a valid phone number, shortcode, or alphanumeric sender ID."]
  end
end
