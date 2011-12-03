class Job < ActiveRecord::Base
  belongs_to :company
  has_many :jobconnections
  has_many :contacts, :through => :jobconnections
end
