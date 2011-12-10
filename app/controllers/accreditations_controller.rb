class AccreditationsController < ApplicationController
  # GET /companies
  # GET /companies.xml
  def index
    @accreditations = Accreditation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @accreditations}
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @accreditation = Accreditation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @accreditation}
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @accreditation = Accreditation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @accreditation}
    end
  end

  # GET /companies/1/edit
  def edit
    @accreditation = Accreditation.find(params[:id])
  end

  # POST /companies
  # POST /companies.xml
  def create
    @accreditation = Accreditation.new(params[:accreditation])

    respond_to do |format|
      if @accreditation.save
        format.html { redirect_to(settings_path) }
        format.xml { render :xml => @accreditation, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @accreditation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @accreditation = Accreditation.find(params[:id])
    respond_to do |format|
      if @accreditation.update_attributes(params[:accreditation])
        format.html { redirect_to(settings_path) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @accreditation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @accreditation = Accreditation.find(params[:id])
    @accreditation.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml { head :ok }
    end
  end


end
