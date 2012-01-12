class JobconnectionsController < ApplicationController
  def new
    @jobconnection = Jobconnection.new
    @contacts = current_user.contacts
    @job = Job.find_by_id(params[:job_id])
    @contact = Contact.new
  end
  
  def create
    
  end
  
end
