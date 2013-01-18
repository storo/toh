class Report < ActiveRecord::Base
  attr_accessible :reason, :stage, :user_id
end
