class Job < ActiveRecord::Base

  has_many :jobconnections
  has_many :contacts, :through => :jobconnections


  belongs_to :user
  
  belongs_to :company
  
  has_many :interactions


  validates :jobtitle,  :presence   => true,
                         :length     => { :maximum => 50 }
  validates_presence_of :company_id  
end
