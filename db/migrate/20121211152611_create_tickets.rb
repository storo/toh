class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :stage_id
      t.integer :user_id
      t.decimal :price

      t.timestamps
    end
  end
end
