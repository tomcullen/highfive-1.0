class JobconnectionsController < ApplicationController
  def new
    @jobconnection = Jobconnection.new
    if params[:job_id].present?
      @contacts = current_user.contacts
      @job = Job.find_by_id(params[:job_id])
      @jobconnection.job = @job
    elsif params[:contact_id].present?
      @jobs = current_user.jobs
      @contact = Contact.find_by_id(params[:contact_id])
      @jobconnection.contact = @contact
    end
      
  end
  
  
  
  def create
    @jobconnection = Jobconnection.new(params[:jobconnection])
    if @jobconnection.save
      redirect_to job_url(params[:jobconnection][:job_id])
    else 
      redirect_to :new
    end
    
  end
  
end
