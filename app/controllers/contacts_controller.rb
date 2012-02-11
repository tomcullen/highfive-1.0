class ContactsController < ApplicationController
  before_filter :require_user
  before_filter :set_contact, :only => [:edit, :show, :destroy]

  def populate
    client = LinkedIn::Client.new("54biq7g6ggjo", "hPbyUdevmHxqvGup")
    client.authorize_from_access(current_user.atoken, current_user.asecret)
    client.connections["all"].each do |connection|
      current_user.contacts.create(firstname: connection["first_name"], lastname: connection["last_name"], jobtitle: connection["headline"])
    end
    redirect_to contacts_url, notice: "Successfully Populated!"
  end
    
  def index
    @contact = Contact.new
    @contacts = current_user.contacts.sort_by{|p| p.lastname.downcase}

  end

  def show
  end


  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user = current_user

    if @contact.save
      if params[:company].present?
        new_contact_company_assn(params[:company])      
      end
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render action: "new"
    end
    
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(params[:contact])

    if params[:company].present?
      find_or_create_company(params[:company])
      if Myfirm.find_by_user_id_and_company_id(current_user.id, @company.id) == nil
        Myfirm.create user_id: current_user.id, :company_id => @company.id
      end
      if Contactcompanyjoin.find_by_contact_id_and_company_id(@contact.id, @company.id) == nil
        Contactcompanyjoin.create contact_id: @contact.id, :company_id => @company.id
      end
    end



    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url
  end

  private

  def set_contact
    if current_user.contacts.find_by_id(params[:id])
      @contact = current_user.contacts.find_by_id(params[:id])
    else
      redirect_to contacts_url, notice: "You don't have access to that page"
    end
  end

  def new_contact_company_assn(company)  
    if Company.find_by_companyname(company)
      @company = Company.find_by_companyname(company)
    else
      @company = Company.create :companyname => company
    end
    
    my_firm = Myfirm.create user_id: current_user.id, :company_id => @company.id
    Contactcompanyjoin.create contact_id: @contact.id, :company_id => @company.id
  end

  def find_or_create_company(name)
    if Company.find_by_companyname(name).present?
      @company = Company.find_by_companyname(name)
    else
      @company = Company.create :companyname => name
    end
  end
  


end
