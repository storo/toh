class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :rate, :subject
end
