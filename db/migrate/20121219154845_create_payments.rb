class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :invoice
      t.string :payer_id
      t.string :payment_date
      t.string :payment_status
      t.string :first_name
      t.string :mc_fee
      t.string :business
      t.string :quantity
      t.string :payer_email
      t.string :payment_type
      t.string :last_name
      t.string :payment_fee
      t.string :item_name
      t.string :mc_currency
      t.string :item_number
      t.string :residence_country
      t.string :payment_gross

      t.timestamps
    end
  end
end
