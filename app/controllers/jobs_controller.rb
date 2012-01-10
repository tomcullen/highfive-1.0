class JobsController < ApplicationController
  before_filter :require_user
  autocomplete :company, :companyname, full: true, auto_focus: true

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
    @company = @job.company 

  end

  def index
    @jobs = current_user.jobs
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    if Company.find_by_companyname(params[:company]).present?
      company = Company.find_by_companyname(params[:company])
    else
      company = Company.create :companyname => params[:company]
    end
    @job = Job.new(params[:job])
    @job.company = company
    @job.user = current_user
    
    if @job.save  
      Myfirm.create user_id: current_user, company_id: company
      redirect_to jobs_url
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(params[:job])
    @job.save
    redirect_to job_url
  end

end
