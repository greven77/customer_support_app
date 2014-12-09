class AddEmailConfirmedToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :email_confirmed, :boolean, null: false, default: false
  end
end
