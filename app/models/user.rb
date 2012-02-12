class User < ActiveRecord::Base
  
  has_secure_password
  
  has_many :events
  has_many :jobs
  has_many :contacts
  
  has_many :myfirms
  has_many :companies, through: :myfirms
  has_many :client_applications
  has_many :tokens, :class_name => "OauthToken", :order => "authorized_at desc", :include => [:client_application]
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :firstname,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :lastname,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness  => {:case_sensitive => false}

  
  
end
