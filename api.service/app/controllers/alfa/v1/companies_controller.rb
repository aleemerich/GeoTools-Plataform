class Alfa::V1::CompaniesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :restrict_access

  # GET /alfa/v1/companies
  def index
    @alfa_v1_companies = Alfa::Company.where(["deleted = 0"])
    render :json => @alfa_v1_companies
  end

  # GET /alfa/v1/companies/1
  def show
    @alfa_v1_company = Alfa::Company.find(params[:id])
    render :json => @alfa_v1_company
  end

  # POST /alfa/v1/companies
  def create
    @alfa_v1_company = Alfa::Company.new(params[:company])
    @alfa_v1_company.company_id = params[:company_id]
    if @alfa_v1_company.save
        render :json => @alfa_v1_company, :status => :created
      else
        render :json => @alfa_v1_company.errors, :status => :unprocessable_entity
    end
  end

  # PUT /alfa/v1/companies/1
  def update
    @alfa_v1_company = Alfa::Company.find(params[:id])
    if @alfa_v1_company.update_attributes(params[:company])
        head :ok
    else
        render :json => @alfa_v1_company.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /alfa/v1/companies/1
  def destroy
    @alfa_v1_company = Alfa::Company.find(params[:id])
    @alfa_v1_company.deleted = true
    if @alfa_v1_company.save
        head :ok
    else
        render :json => @alfa_v1_company.errors, :status => :unprocessable_entity
	end
  end
end
