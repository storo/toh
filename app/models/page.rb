class Page < ActiveRecord::Base
  attr_accessible :content, :title, :url
end
