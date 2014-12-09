class AddDefaultValueToRoleInUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => "staff"
  end
end
