class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def edit
  end

  def index
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end
  
  def create
    @company = Company.new(params[:company])
    @company.save
    redirect_to companies_url
  end
  
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_url
  end


end
