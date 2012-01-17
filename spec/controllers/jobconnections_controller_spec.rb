require 'spec_helper'

describe JobconnectionsController do

  describe "CREATE" do

    describe "success" do

      it "should create a job connection given a job_id and contact_id" do
        contact = Contact.create(firstname: "John", lastname: "Wayne")
        company = Company.create(companyname: "Bonanza")
        job = Job.create(jobtitle:"Gunslinger", company_id: company.id)
        @jobconnection = Jobconnection.create(contact_id: contact, job_id: job)
        @jobconnection.contact.should == contact
        @jobconnection.job.should == job      
      end
    end
  end
end