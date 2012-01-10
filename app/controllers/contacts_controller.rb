class ContactsController < ApplicationController
  before_filter :require_user

  # GET /contacts
  # GET /contacts.json
  def index
    # @contacts = Contact.all
    # @contact = session[:user_id]
    # @contacts = Contact.find_by_user_id(:user_id)
    @user = User.find(session[:user_id])
    @contacts = @user.contacts


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create

    @contact = Contact.new(params[:contact])
    @contact.user = current_user

    if Company.find_by_companyname(params[:company]).present?
      company = Company.find_by_companyname(params[:company])
    else
      company = Company.create :companyname => params[:company]
      #company.user_id = current_user
    end



    respond_to do |format|
      if @contact.save
        Contactcompanyjoin.create contact_id: @contact.id, :company_id => company.id
        Myfirm.create user_id: current_user, :company_id => company
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])
    company = associate_company(params[:company])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        Contactcompanyjoin.create contact_id: @contact.id, :company_id => company.id
        Myfirm.create user_id: current_user, :company_id => company.id
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def associate_company(name)
    if Company.find_by_companyname(name).present?
      company = Company.find_by_companyname(name)
    else
      company = Company.create :companyname => name
      #company.user_id = current_user
    end    
  end
end
