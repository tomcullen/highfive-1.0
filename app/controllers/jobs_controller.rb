class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

  end

  def index
    @job = Job.all
  end

  def edit
    @job = Job.find(params[:id])
  end
  
  def create
    @job = Job.new(params[:job])
    @job.save
    redirect_to jobs_url    
  end
  
  def update
    @job = Job.find(params[:id])
    @job.update_attributes(params[:job])
    @job.save
    redirect_to job_url
  end

end
