class Ticket < ActiveRecord::Base
  belongs_to :user

  before_create :set_reference
  before_save :set_previous_status
  after_save :create_event

  attr_accessor :reply_subject, :reply_message

  def set_reference
    begin
      self.reference = create_reference
    end while self.class.exists?(:reference => reference)
  end

  def set_previous_status
    last_event = Event.where(reference: self.reference).last
    self.previous_status = last_event.current_status if last_event
  end

  def create_event
    Event.create!(previous_status: self.previous_status,
      current_status: self.status, 
      issue: self.issue,
      reference: self.reference)
  end

  def send_confirmation_email
    Notifier.confirmation_email(self).deliver
  end

  def send_reply_email(reply, subject)
    Notifier.reply_email(reply, subject, self)
  end

  private
    def get_random_chars
      (0..2).map { (65 + rand(26)).chr }.join
    end

    def get_random_hex
      SecureRandom.hex.slice(0,2).upcase
    end

    def create_reference
      "#{get_random_chars}-#{get_random_hex}-#{get_random_chars}" +
      "-#{get_random_hex}-#{get_random_chars}"
    end
end
