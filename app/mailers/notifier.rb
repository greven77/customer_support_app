class Notifier < ActionMailer::Base
  #default from: "OnApp Issue tracker <#{ActionMailer::Base.smtp_settings[:user_name]}"
  default from: "from@example.com"

  def confirmation_email(ticket)
    @reference = ticket.reference
    mail(:to => ticket.email, 
      :subject => "Please confirm your issue support request on OnApp.com")
  end

  def reply_email(ticket)
    @ticket = ticket
    mail(:to => ticket.email,
       :subject => ticket.reply_subject)
  end
end
