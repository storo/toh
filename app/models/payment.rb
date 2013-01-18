class Payment < ActiveRecord::Base
  attr_accessible :business, :first_name, :invoice, :item_name, :item_number, :last_name, :mc_currency, :mc_fee, :payer_email, :payer_id, :payment_date, :payment_fee, :payment_gross, :payment_status, :payment_type, :quantity, :residence_country
end
