class JobsController < ApplicationController
  before_filter :require_user
  before_filter :set_job, only: [:show, :edit, :destroy]

  autocomplete :company, :companyname, full: true, auto_focus: true

  def set_job
    if current_user.jobs.find_by_id(params[:id])
      @job = Job.find(params[:id])
      @company = @job.company 
    else
      redirect_to jobs_url, notice: "You dont have access to that page."
    end
  end

  def new
    @job = Job.new
  end

  def show
    
  end

  def index
    @jobs = current_user.jobs
  end

  def edit
  end
  
  def destroy
    @job.destroy
    redirect_to jobs_url, notice: "Job deleted"
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
      redirect_to job_url(@job)
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
