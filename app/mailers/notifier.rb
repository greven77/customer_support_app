class Notifier < ActionMailer::Base
  #default from: "OnApp Issue tracker <#{ActionMailer::Base.smtp_settings[:user_name]}"
  default from: "from@example.com"

  def confirmation_email(ticket)
    @reference = ticket.reference
    mail(:to => ticket.email, 
      :subject => "Please confirm your issue support request on OnApp.com")
  end

  def reply_email(reply, subject, ticket)
    @reply = reply
    mail(:to => ticket.email,
       :subject => subject)
  end
end
