class Alfa::TablesController < ApplicationController
  #skip_before_filter :verify_authenticity_token
  before_filter :restrict_access
  
  # GET /alfa/tables
  def index
    # Preparando cabeçalho de resposta
  	response = {}
    response["kind"] = "data#tables"
    response["nextPageToken"] = params[:token] #TODO: Precisa?

    # Obtendo as tabelas cadastradas
  	tables = Alfa::Table.all

    # Criando Array que terá as tabelas cadastradas e seus dados
    table_list = []
    tables.each do |table|
      # Dados sobre a tabela 
      table_details = {}
      table_details["kind"] = "data#table"
      table_details["tableId"] =  table.name
      table_details["name"] = table.fullname

      # Dados dos campos
      arr_details = []
      structure = ActiveRecord::Base.connection.execute("DESCRIBE " + table.name) 
      structure.each(:as => :hash) do |row|
        details = {}
        details["kind"] = "data#column"
        details["columnId"] = 0 # TODO: Verificar pra que serve e se precisa
        details["name"] = row["Field"]
        # Compatibilizando tipo com Fusion Table
        case 
          when !row["Type"].index("int").nil? || !row["Type"].index("decimal").nil? || !row["Type"].index("numeric").nil?
            details["type"] = "NUMERIC"
          when !row["Type"].index("date").nil?
            details["type"] = "DATETIME"
          when !row["Type"].index("geo").nil?
            details["type"] = "LOCATION"
          else
            details["type"] = "STRING"
        end
  	    arr_details << details
      end
      table_details["columns"] = arr_details
      table_list << table_details
  	end
    response["itens"] = table_list
    render :json => response
  end

  # GET /alfa/v1/tables/1
  def show
    # Implementar
  end

  # POST /alfa/v1/tables
  def create
    # Upload aquivo

    # Importação de arquivo para XML/KML
    doc =  REXML::Document.new File.new(params[:file])

    # Obtendo lista (array) de registros do XML
    features = doc.elements.to_a("//Placemark")

    # Obter a estrura de dados

    # Criar uma nova tabela baseada na estrutura de dados

    # Gravar um novo registro na tabela TABLES
    table = Alfa::Table.new
    table.name = SecureRandom.hex(64)
    table.fullname = params[:table_name]
    if table.save

      # Processando registro a registro
      features.each do |feature|
        # Extrair dados

        # Fazer insert na nova tabela criada
      end

      render :json => table, :status => :created
    else
      render :json => layer.errors, :status => :unprocessable_entity
    end
  end

  # PUT /alfa/v1/tables/1
  def update
    # Implementar
  end

  # DELETE /alfa/v1/tables/1
  def destroy
    # Achar nome da tabela a ser apagada
    table = Alfa::Tables.find(params[:id])

    # Executar script de deleção de tabela
    structure = ActiveRecord::Base.connection.execute("TRUCATE TABLE ${table.name}")

    # Apagar registro da tabela TABLES
    table.destroy

    # Retornar ao navegador
		head :ok

  end
end
