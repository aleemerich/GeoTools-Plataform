class Alfa::V1::LayersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :restrict_access
  
  # GET /alfa/v1/layers
  def index
    @alfa_v1_layers = Alfa::Layer.joins(:company_layer).where("alfa_company_layers.company_id = ? AND alfa_layers.deleted = 0", session[:company_id]).order("alfa_layers.name")
 
    list = @alfa_v1_layers.map do |x| { 
      :id => x.id, 
      :worktable_id =>  x.worktable_id,
      :worktable_name => x.worktable.name, # objeto externo
      :worktable_rating => x.worktable.rating, # objeto externo
      :geometry_field => x.geometry_field, 
      :geometry_type => x.geometry_type, 
      :label => x.label,
      :outline_color => x.outline_color,
      :fill_color => x.fill_color,
      :fill_opacity => x.fill_opacity,
      :external_graphic => x.external_graphic,
      :maximum_zoom => x.maximum_zoom, 
      :minimum_zoom => x.minimum_zoom, 
      :fields_show => x.fields_show,
      :name => x.name} 

    end

    render :json => list 
  end

  # GET /alfa/v1/layers/1
  def show
    @alfa_v1_layers = Alfa::Layer.find(params[:id])
    @alfa_v1_layers.fill_opacity = @alfa_v1_layers.fill_opacity.blank? ? 0.00 : @alfa_v1_layers.fill_opacity

    render :json => {
      :id => @alfa_v1_layers.id, 
      :worktable_id =>  @alfa_v1_layers.worktable_id,
      :worktable_name => @alfa_v1_layers.worktable.name, # objeto externo
      :worktable_alias => @alfa_v1_layers.worktable.alias, # objeto externo
      :geometry_field => @alfa_v1_layers.geometry_field, 
      :geometry_type => @alfa_v1_layers.geometry_type, 
      :label => @alfa_v1_layers.label,
      :outline_color => @alfa_v1_layers.outline_color,
      :fill_color => @alfa_v1_layers.fill_color,
      :fill_opacity => @alfa_v1_layers.fill_opacity.to_s('2F'),
      :external_graphic => @alfa_v1_layers.external_graphic,
      :maximum_zoom => @alfa_v1_layers.maximum_zoom, 
      :minimum_zoom => @alfa_v1_layers.minimum_zoom, 
      :fields_show => @alfa_v1_layers.fields_show,
      :observation => @alfa_v1_layers.observation,
      :name => @alfa_v1_layers.name 
    }
  end

  # POST /alfa/v1/layers
  def create
    layer = Alfa::Layer.new
    layer.worktable_id = params[:layer][:worktable_id]
    layer.name = params[:layer][:name]
    layer.geometry_type = params[:layer][:geometry_type]
    layer.geometry_field = params[:layer][:geometry_field]
    layer.outline_color = params[:layer][:outline_color]
    layer.fill_color = params[:layer][:fill_color]
    layer.fill_opacity = params[:layer][:fill_opacity]
    layer.external_graphic = params[:layer][:external_graphic]
    layer.label = params[:layer][:label]
    layer.user_id = Alfa::Token.find_by_token(params[:token]).user.id
    layer.observation = params[:layer][:observation]
    layer.fields_show = params[:layer][:fields_show]

    user_company_id = Alfa::Token.find_by_token(params[:token]).user.company_id

    if layer.save
        if !params[:layer][:layer_companies].empty?
          nOk = true
          params[:layer][:layer_companies].each do |c|
            addCiaLayer(layer.id, c.to_i)
            if c.to_i == user_company_id
              nOk = false;
            end
          end

          if nOk
            addCiaLayer(layer.id, user_company_id)
          end           
        else
          addCiaLayer(layer.id, user_company_id)
        end
  		  render :json => layer, :status => :created
  	else
  		render :json => layer.errors, :status => :unprocessable_entity
  	end
  end

  # PUT /alfa/v1/layers/1
  def update
    layer = Alfa::Layer.find(params[:id])
    layer.worktable_id = params[:layer][:worktable_id]
    layer.name = params[:layer][:name]
    layer.geometry_type = params[:layer][:geometry_type]
    layer.geometry_field = params[:layer][:geometry_field]
    layer.outline_color = params[:layer][:outline_color]
    layer.fill_color = params[:layer][:fill_color]
    layer.fill_opacity = params[:layer][:fill_opacity]
    layer.external_graphic = params[:layer][:external_graphic]
    layer.label = params[:layer][:label]
    layer.user_id = Alfa::Token.find_by_token(params[:token]).user.id
    layer.observation = params[:layer][:observation]
    layer.fields_show = params[:layer][:fields_show]

    user_company_id = Alfa::Token.find_by_token(params[:token]).user.company_id


    if layer.save
        Alfa::CompanyLayer.destroy_all(:layer_id => layer.id)

        if !params[:layer][:layer_companies].empty?
          nOk = true

          params[:layer][:layer_companies].each do |c|
            addCiaLayer(layer.id, c.to_i)
            if c.to_i == user_company_id
              nOk = false;
            end
          end

          if nOk
            addCiaLayer(layer.id, user_company_id)
          end           
        else
          addCiaLayer(layer.id, user_company_id)
        end
        head :ok
    else
      render :json => layer.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /alfa/v1/layers/1
  def destroy
    @alfa_v1_layers = Alfa::Layer.find(params[:id])
    @alfa_v1_layers.deleted = true;
    if @alfa_v1_layers.save
		  head :ok
    else
      render :json => @alfa_v1_layers.errors, :status => :unprocessable_entity
    end

  end

  # GET /alfa/v1/layers/companies/1
  def companies
    cias = Alfa::CompanyLayer.select(:company_id).find_all_by_layer_id(params[:id])
    # TODO: Revisar se essa é a melhor forma de enviar um array de ID
    arrIdsCias = Array.new
    cias.each do |c|
      arrIdsCias << c.company_id
    end
    render :json => arrIdsCias
  end
end

def addCiaLayer(layer_id, company_id)
  ciaLayer = Alfa::CompanyLayer.new
  ciaLayer.layer_id = layer_id
  ciaLayer.company_id = company_id
  ciaLayer.save 
end