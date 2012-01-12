class Contactcompanyjoin < ActiveRecord::Base
  belongs_to :company
  belongs_to :contact
  
  # def self.unique_companies
  #   current_user.companies.uniq!
  # end
  



  
end
