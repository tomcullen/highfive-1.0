class Company < ActiveRecord::Base

  has_many :contactcompanyjoins
  has_many :contacts, through: :contactcompanyjoins
  
  has_many :jobs
  
  has_many :myfirms
  has_many :users, through: :myfirms

  validates_presence_of :companyname
  
  
  # def self.from_input(params[:company])
  #   find_by_companyname(params[:company].capitalize) || create_new_from_input(params[:company])
  # end
  # 
  # def self.create_new_from_input(params[:company])
  #   create! do |company|
  #     company.companyname = params[:company].capitalize
  #   end
  # end

  # def my_companies_contacts
  #   current_user.contacts.select do |contact|
  #     contact.companies.include? @company
  #   end
  # end

end
