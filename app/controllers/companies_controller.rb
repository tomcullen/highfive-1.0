class CompaniesController < ApplicationController

  before_filter :require_user

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def index
    @companies = current_user.companies.uniq.sort_by{|p| p.contacts.count}.reverse
  end

  def show
    @company = Company.find(params[:id])
    # @job = current_user.jobs.find(params[:id])
    @my_companies_contacts = current_user.contacts.select do |contact| contact.companies.include? @company end
    # @my_companies_jobs = current_user.jobs.select do |job| job.companies.include? @job end
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      # current_user.myfirms.create(company_id: @company.id)
      Myfirm.create user_id: current_user.id, :company_id => @company.id
      
      # firm = Myfirm.new :user_id => current_user.id, :company_id => @company.id
      redirect_to companies_url, notice: "company created"
    else
      render :new
    end
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
