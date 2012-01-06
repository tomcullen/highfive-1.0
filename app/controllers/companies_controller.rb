class CompaniesController < ApplicationController
  
  before_filter :require_user
  
  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def index
      @companies = current_user.companies.uniq!

  
  end

  def show
    @company = Company.find(params[:id])
    
  end
  
  def create
    @company = Company.new(params[:company])
    
    @company.save
    Myfirm.create :user_id => current_user, :company_id => @company.id

    redirect_to companies_url, notice: "company created"

  end
  
  def update
    @company = Company.find(params[:id])
    @company.update_attributes(params[:company])
    @company.save
    redirect_to companies_url
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_url
  end


end
