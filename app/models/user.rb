class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :jobs
  has_many :contacts
  has_many :companies
  
end
