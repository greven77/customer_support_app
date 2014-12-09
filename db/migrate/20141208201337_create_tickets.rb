class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :name
      t.string :email
      t.string :department
      t.text :issue
      t.string :reference
      t.string :status
      t.references :user, index: true

      t.timestamps
    end
  end
end
