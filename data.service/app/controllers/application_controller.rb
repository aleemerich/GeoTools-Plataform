require 'net/http'

class ApplicationController < ActionController::Base
  protect_from_forgery

  # Autentica o token na API da ARICH
  def restrict_access  
  	# Não sei o porque, mas é precisa instanciar esse objeto
  	response = nil
  	
  	# Verifica se o TOKEN existe
  	# TODO: Fazer uma validação do TOKEN quando for chamá-lo
  	# ao invés de fazer isso aqui, pois economiza uma chamada
  	if params[:token].nil?
  		# bloqueia o acesso
  		head :unauthorized # retirar no futuro quando melhorar a analise do token
  	else
  		# Faz a chamada pro API da Arich mediante parâmetros no CONFIG da aplicação Rails
		Net::HTTP.start(Rails.application.config.authentication_location, Rails.application.config.authentication_port) {|http|
				response = http.head(Rails.application.config.authentication_complement + params[:token])
		}

		# Analisa o retorno da chamada da API, se algo diferente de
		# 200 ele rejeita a autenticação
		if response.code != "200"
			head :unauthorized
		end  
	end
  end
end
