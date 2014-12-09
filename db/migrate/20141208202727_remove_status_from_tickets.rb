class RemoveStatusFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :status
  end
end
