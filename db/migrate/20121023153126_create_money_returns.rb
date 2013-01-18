class CreateMoneyReturns < ActiveRecord::Migration
  def change
    create_table :money_returns do |t|
      t.integer :user_id
      t.integer :tokens
      t.date :date_return
      t.integer :status

      t.timestamps
    end
  end
end
