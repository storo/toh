class CreateStageItems < ActiveRecord::Migration
  def change
    create_table :stage_items do |t|
      t.integer :user_id
      t.string :item
      t.integer :amount

      t.timestamps
    end
  end
end
