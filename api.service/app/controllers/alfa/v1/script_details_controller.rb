class Alfa::V1::ScriptDetailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # GET /alfa/v1/script_details
  def index
    begin
      @alfa_v1_script_details = Alfa::ScriptDetail.joins(:script).where("alfa_scripts.company_id = ? AND alfa_script_details.deleted = 0", params[:company_id]).all
      render :json => @alfa_v1_script_details 
    rescue => e
      render :json => json_error(e), :status => 400
    end
  end

  # GET /alfa/v1/script_details/1
  def show
  	begin
    	@alfa_v1_script_detail = Alfa::ScriptDetail.joins(:script).where("alfa_scripts.company_id = ? AND alfa_script_details.deleted = 0", session[:company_id]).find(params[:id])
    	render :json => @alfa_v1_script_detail 
    rescue => e
    	render :json => json_error(e), :status => 400
    end
  end
end
