class CreatePrivacies < ActiveRecord::Migration
  def change
    create_table :privacies do |t|
      t.integer :user_id
      t.integer :option1
      t.integer :option2
      t.integer :option3
      t.integer :option4
      t.integer :option5
      t.string :option6

      t.timestamps
    end
  end
end
