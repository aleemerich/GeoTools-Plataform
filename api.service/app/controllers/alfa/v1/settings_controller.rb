class Alfa::V1::SettingsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  # GET /alfa/v1/settings
  def index
    @alfa_v1_settings = Alfa::Setting.where("company_id = ?", params[:company_id])
    render :json => @alfa_v1_settings
  end

  # GET /alfa/v1/settings/1
  def show
  end

  # POST /alfa/v1/settings
  def create
  end

  # PUT /alfa/v1/settings/1
  def update
  end

  # DELETE /alfa/v1/settings/1
  def destroy
  end
end
