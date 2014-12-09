class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :reference
      t.string :previous_status
      t.string :current_status
      t.string :issue

      t.timestamps
    end
  end
end
