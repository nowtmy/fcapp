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
    @contacts= Contact.find(:all)
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
    @contacts= Contact.find(:all)
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully modified contact."
      @contacts= Contact.all
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.xml { head :ok }
    end
  end
end
