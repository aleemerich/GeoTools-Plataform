class Alfa::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :restrict_access
  
  # GET /alfa/v1/users
  def index
    @alfa_v1_users = Alfa::User.select("alfa_users.id, alfa_users.name, alfa_companies.name AS 'company_name', alfa_users.email, alfa_users.blocked, alfa_users.date_expiration").joins(:company).where("alfa_users.deleted = 0 AND alfa_companies.deleted = 0")
    render :json => @alfa_v1_users 
  end

  # GET /alfa/v1/users/1
  def show
    @alfa_v1_user = Alfa::User.find(params[:id])
    render :json => @alfa_v1_user 
  end

  # POST /alfa/v1/users
  def create
    @alfa_v1_user = Alfa::User.new(params[:user])
	  @alfa_v1_user.password = Digest::SHA1.hexdigest(@alfa_v1_user.password)
    
    if @alfa_v1_user.save
  		render :json => @alfa_v1_user, :status => :created
  	else
  		render :json => @alfa_v1_user.errors, :status => :unprocessable_entity
  	end
  end

  # PUT /alfa/v1/users/1
  def update
    @alfa_v1_user = Alfa::User.find(params[:id])
    old_pass = @alfa_v1_user.password
  	@alfa_v1_user.update_attributes(params[:user])
  	@alfa_v1_user.password.blank? ? @alfa_v1_user.password = old_pass : @alfa_v1_user.password = Digest::SHA1.hexdigest(@alfa_v1_user.password)
    
    if @alfa_v1_user.save
		  head :ok
    else
      render :json => @alfa_v1_user.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /alfa/v1/users/1
  def destroy
    @alfa_v1_user = Alfa::User.find(params[:id])
    @alfa_v1_user.deleted = true;
    if @alfa_v1_user.save
		  head :ok
    else
      render :json => @alfa_v1_user.errors, :status => :unprocessable_entity
    end
  end
end
