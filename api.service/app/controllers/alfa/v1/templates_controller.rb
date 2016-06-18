class Alfa::V1::TemplatesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # GET /alfa/v1/templates
  def index
    @alfa_v1_templates = Alfa::Template.all
    render :json => @alfa_v1_templates 
  end

  # GET /alfa/v1/templates/1
  def show
    @alfa_v1_template = Alfa::Template.find(params[:id])
    #render :json => @alfa_v1_template
    render :json => {
      :id => @alfa_v1_template.id, 
      :name =>  @alfa_v1_template.name,
      :content => @alfa_v1_template.content
    } 
  end

  # POST /alfa/v1/templates
  def create
    @alfa_v1_template = Alfa::Template.new(params[:Template])
    if @alfa_v1_template.save
  		render :json => @alfa_v1_template, :status => :created
  	else
  		render :json => @alfa_v1_template.errors, :status => :unprocessable_entity
  	end
  end

  # PUT /alfa/v1/templates/1
  def update
    @alfa_v1_template = Alfa::Template.find(params[:id])
	@alfa_v1_template.update_attributes(params[:Template])
    if @alfa_v1_template.save
		  head :no_content
    else
      render :json => @alfa_v1_template.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /alfa/v1/templates/1
  def destroy
  end
end
