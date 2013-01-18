class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :stage
      t.string :reason
      t.integer :user_id

      t.timestamps
    end
  end
end
