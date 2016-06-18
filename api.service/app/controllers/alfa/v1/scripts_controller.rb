class Alfa::V1::ScriptsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  # GET /alfa/v1/scripts
  def index
    begin
      @alfa_v1_script = Alfa::Script.where("company_id = ? AND deleted = 0", params[:company_id]).all
      render :json => @alfa_v1_script 
    rescue => e
      render :json => json_error(e), :status => 400
    end
  end

  # GET /alfa/v1/scripts/1
  def show
  	begin
    	@alfa_v1_script = Alfa::Script.where("company_id = ? AND deleted = 0", session[:company_id]).find(params[:id]);
    	render :json => @alfa_v1_script 
    rescue => e
    	render :json => json_error(e), :status => 400
    end
  end

end
