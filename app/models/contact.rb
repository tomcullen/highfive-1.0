class Contact < ActiveRecord::Base
  belongs_to :user
 
  
  has_many :jobconnections
  has_many :jobs, through: :jobconnections
  
  has_many :interactions
  
  
  has_many :companies, :through => :contactcompanyjoins
  has_many :contactcompanyjoins
end
