class AddPreviousStatusIdAndStatusIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :previous_status_id, :integer
    add_column :tickets, :status_id, :integer
  end
end
