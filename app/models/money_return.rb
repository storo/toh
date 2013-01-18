class MoneyReturn < ActiveRecord::Base
  attr_accessible :date_return, :status, :tokens, :user_id
end
