class Ticket < ActiveRecord::Base
  attr_accessible :price, :stage_id, :user_id
end
