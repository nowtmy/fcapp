class ContactsController < ApplicationController
  before_filter :require_user
  layout 'contact'

  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contacts= Contact.all
    @contact = Contact.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.js # new.html.erb
    #  format.xml  { render :xml => @contact }
    #end
  end

  # GET /contacts/1/edit
  def edit
    @contacts= Contact.all
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contacts= Contact.all
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Successfully created contact."
      @contacts= Contact.all
    end

    #respond_to do |format|
    #  if @contact.save
    #    format.html { redirect_to(@contact, :notice => 'Contact was successfully created.') }
    #    format.xml  { render :xml => @contact, :status => :created, :location => @contact }
    #  else
    #    format.html { render :action => "new" }
    #    format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to(@contact, :notice => 'Contact was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml { head :ok }
    end
  end
end