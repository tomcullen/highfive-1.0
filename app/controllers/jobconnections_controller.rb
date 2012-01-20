class JobconnectionsController < ApplicationController
  def new
    @jobconnection = Jobconnection.new
    if params[:job_id].present?
      @contacts = current_user.contacts.order("lastname ASC")
        #where contact is not already associated with this job
      @job = Job.find_by_id(params[:job_id])
      @jobconnection.job = @job
    elsif params[:contact_id].present?
      @jobs = current_user.jobs.order("jobtitle ASC")
        #where job is not already associated with this contact
      @contact = Contact.find_by_id(params[:contact_id])
      @jobconnection.contact = @contact
    end
      
  end
  
  
  
  def create
    job = params[:jobconnection][:job_id]
    contact = params[:jobconnection][:contact_id]
    if contact.empty? || job.empty?
      redirect_to new_jobconnection_url(params[:jobconnection]), notice: "Pick something from the dropdown!"
    elsif
      Jobconnection.find_by_contact_id(contact) && Jobconnection.find_by_job_id(job)
      redirect_to new_jobconnection_url(params[:jobconnection]), notice: "That Job-Contact association already exists"
    elsif
      @jobconnection = Jobconnection.new(params[:jobconnection])
      @jobconnection.save
      redirect_to job_url(job)
    end
  end
end
