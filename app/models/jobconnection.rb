class Jobconnection < ActiveRecord::Base
  belongs_to :contact
  belongs_to :job
  
end
