require 'rails_helper'
require 'spec_helper'

RSpec.describe Notifier, :type => :mailer do
    let!(:ticket) { FactoryGirl.create(:ticket) }

    let(:confirmation_email) do
      Notifier.confirmation_email(ticket)
    end

    let(:reply_email) do
      ticket.reply_subject = "Hello"
      ticket.reply_message = "Hello world"
      Notifier.reply_email(ticket)
    end

    it "sends out an email to confirm customer's email" do
      confirmation_email.to.should include(ticket.email)
      confirmation_email.subject.should include("Please confirm your issue support request on OnApp.com")
      confirmation_email.body.should include("Your request for support from OnApp.com has been received")
      confirmation_email.body.should include("Click here to confirm your issue reports")
      confirmation_email.body.should include('Confirm email')
      confirmation_email.body.should include(ticket_confirmation_url(ticket.reference))
      confirmation_email.body.should include('Click here to check your request status')
      confirmation_email.body.should include('Check request status')
      confirmation_email.body.should include(ticket_history_url(ticket.reference))
    end

    it "sends out an email to reply to a customer's request" do
      reply_email.to.should include(ticket.email)
      reply_email.subject.should include(ticket.reply_subject)
      reply_email.body.should include("Subject:")
      reply_email.body.should include(ticket.reply_subject)
      reply_email.body.should include("Message:")
      reply_email.body.should include(ticket.reply_message)
    end
end