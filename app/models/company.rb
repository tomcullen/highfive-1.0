class Company < ActiveRecord::Base

  has_many :contactcompanyjoins
  has_many :contacts, through: :contactcompanyjoins
  
  has_many :jobs
  
  has_many :myfirms
  has_many :users, through: :myfirms


  # def self.from_input(params[:company])
  #   find_by_companyname(params[:company].capitalize) || create_new_from_input(params[:company])
  # end
  # 
  # def self.create_new_from_input(params[:company])
  #   create! do |company|
  #     company.companyname = params[:company].capitalize
  #   end
  # end



end
