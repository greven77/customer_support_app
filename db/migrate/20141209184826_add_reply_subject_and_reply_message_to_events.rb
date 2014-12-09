class AddReplySubjectAndReplyMessageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reply_subject, :string
    add_column :events, :reply_message, :text
  end
end
