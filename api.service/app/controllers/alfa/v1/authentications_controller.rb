class Alfa::V1::AuthenticationsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	#Autenticacao
	def create
		@user = Alfa::User.where(["email = ? AND password = ? AND blocked = 0 AND (date_expiration IS NULL OR date_expiration >= ?)", params[:email], Digest::SHA1.hexdigest(params[:password]), DateTime.now]).first
		if @user
			@token = Alfa::Token.new
			@token.user_id = @user.id
			@token.expires_at = DateTime.now + Alfa::Setting.find_by_name("token_duration").value.to_i
			if @token.save
				delivery = {:token => @token.token, :token_id => @token.id, :name => @user.name, :change_password => @user.change_password}
				render :json => delivery
			else
				render :json => @token.errors, :status => :unprocessable_entity
			end
		else
			head :unauthorized
		end
	end
	
	#Change Password
	def update
		@user = Alfa::User.find_by_email(params[:email])
		if @user
			new_password = SecureRandom.hex(6)
			#TODO: falta envio de nova senha
			@user.password = Digest::SHA1.hexdigest(new_password)
			@user.save
			head :ok
		else
			head :unprocessable_entity
		end
	end
	
	#Log-off
	def destroy
		@token = Alfa::Token.find_by_token(params[:token])
		if @token
			@token.destroy
			head :ok	
		else
			head :unprocessable_entity
		end
	end
end
