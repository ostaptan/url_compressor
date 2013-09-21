class Audit < ActiveRecord::Base
  attr_accessible :remote_ip
  belongs_to :url_store
  
  validates_presence_of :remote_ip
end
