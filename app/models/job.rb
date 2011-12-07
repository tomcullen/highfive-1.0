class Job < ActiveRecord::Base

  has_many :jobconnections
  has_many :contacts, :through => :jobconnections

  belongs_to :user
  
  belongs_to :company
  
  has_many :interactions
  
end
