class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  layout 'signup'

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to settings_path
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    flag = !params[:user][:fellow_flag].nil? ? true :false
    #raise flag.inspect
    respond_to do |format|
      if @user.update_attributes(params[:user])
        if flag
          @access = Accessability.find_or_create_by_user_id(@user.id)
          @access.role_1 = params[:user][:create_certificates_and_reports]
          @access.role_2 = params[:user][:signoff_certificates_and_reports]
          @access.role_3 = params[:user][:access_account_settings]
          @access.save
        end

        format.html { redirect_to(settings_path, :notice => 'User was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml { head :ok }
    end
  end

  def settings
    @company = Company.new
    @contact = Contact.last
    render :layout => 'settings'
  end

  def fellowers
    @fellower = User.new(params[:user])
    @fellower.save
    set_acccessability_for_user(@fellower)
  end

  def edit_fellowers

  end
end


private

def set_acccessability_for_user(user)
  @user = user
  @access = Accessability.find_or_create_by_user_id(@user.id)
  @access.role_1 = user.create_certificates_and_reports
  @access.role_2 = user.signoff_certificates_and_reports
  @access.role_3 = user.access_account_settings
  redirect_to settings_path
end