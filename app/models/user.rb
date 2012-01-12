class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :jobs
  has_many :contacts
  has_many :myfirms
  has_many :companies, through: :myfirms
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :firstname,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :lastname,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness  => {:case_sensitive => false}

  
  
end
