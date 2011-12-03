class Contact < ActiveRecord::Base
  has_many :jobs
  has_many :jobs, :through => :jobconnections
  has_many :companies
end
