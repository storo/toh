class CreateElementStages < ActiveRecord::Migration
  def change
    create_table :element_stages do |t|
      t.integer :user_id
      t.string :types
      t.integer :amount

      t.timestamps
    end
  end
end
