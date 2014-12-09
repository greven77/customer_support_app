class RemovePreviousStatusIdAndStatusIdToTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :previous_status_id
    remove_column :tickets, :status_id
    add_column :tickets, :previous_status, :string
    add_column :tickets, :status, :string
  end
end
