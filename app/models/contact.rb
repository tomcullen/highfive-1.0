class Contact < ActiveRecord::Base
  belongs_to :user
 
  
  has_many :jobconnections
  has_many :jobs, through: :jobconnections
  
  has_many :interactions
  
  
  has_many :companies, :through => :contactcompanyjoins
  has_many :contactcompanyjoins 
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
  
  validates :firstname,  :presence   => true,
                    :length     => { :maximum => 50 }
  validates :lastname,  :presence   => true,
                    :length     => { :maximum => 50 }

  validates :email, :format      => { :with => email_regex },
                    :uniqueness  => {:case_sensitive => false}

  validates :mainphone,   :format  => { :with => phone_regex }
  validates :workphone,   :format  => { :with => phone_regex }
  validates :faxnumber,   :format  => { :with => phone_regex }


end
