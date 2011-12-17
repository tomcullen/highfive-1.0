class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

  end

  def index
   #@job = Job.find(params[:id])
  # @job = @jobs.find_by current_user
    @jobs = current_user.jobs
  end

  def edit
    @job = Job.find(params[:id])
  end
  
  def create
    @job = Job.new(params[:job])
    @job.user = current_user
    if Company.find_by_companyname(params[:company]).present?
      company = Company.find_by_companyname(params[:company])
    else
      company = Company.create :companyname => params[:company]
    end
    
    @job.company = company
    
    @job.save  
    Myfirm.create user_id: current_user, company_id: company
    
    redirect_to jobs_url
       
  end
  
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(params[:job])
    @job.save
    redirect_to job_url
  end

end
