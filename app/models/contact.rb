class Contact < ActiveRecord::Base
  has_many :jobconnections
  has_many :jobs, :through => :jobconnections
  has_many :companies
end
