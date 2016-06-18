class Alfa::V1::WorktablesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :restrict_access
  
  # GET /alfa/v1/worktables
  def index
    @alfa_v1_worktables = Alfa::Worktable.where(["deleted = 0"]).limit(Alfa::Setting.find_by_name("limit_return_index").value.to_i)
    render :json => @alfa_v1_worktables 
  end

  # GET /alfa/v1/worktables/1
  def show
    @alfa_v1_worktable = Alfa::Worktable.find(params[:id])
    render :json => @alfa_v1_worktable 
  end

  # POST /alfa/v1/worktables
  def create
    @alfa_v1_worktable = Alfa::Worktable.new(params[:worktable])
    @alfa_v1_worktable.user_id = session[:user_id]
    if @alfa_v1_worktable.save
  		render :json => @alfa_v1_worktable, :status => :created
  	else
  		render :json => @alfa_v1_worktable.errors, :status => :unprocessable_entity
  	end
  end

  # PUT /alfa/v1/worktables/1
  def update
    @alfa_v1_worktable = Alfa::Worktable.find(params[:id])
	@alfa_v1_worktable.update_attributes(params[:worktable])
    if @alfa_v1_worktable.save
		  head :ok
    else
      render :json => @alfa_v1_worktable.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /alfa/v1/worktables/1
  def destroy
    @alfa_v1_worktable = Alfa::Worktable.find(params[:id])
    @alfa_v1_worktable.deleted = true;
    if @alfa_v1_worktable.save
		  head :ok
    else
      render :json => @alfa_v1_worktable.errors, :status => :unprocessable_entity
    end
  end
end
