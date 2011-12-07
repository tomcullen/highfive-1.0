class Company < ActiveRecord::Base

  has_many :contactcompanyjoins
  has_many :contacts, through: :contactcompanyjoins
  
  has_many :jobs
end
