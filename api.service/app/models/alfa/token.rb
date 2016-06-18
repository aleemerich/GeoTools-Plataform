class Alfa::Token < ActiveRecord::Base
  belongs_to :user
  before_create :generate_token
  attr_accessible :expires_at, :rules, :token, :user_id
  
  private
  # Gerando TOKEN UNICO ao gravar um registro
  def generate_token
	begin
		self.token = SecureRandom.hex(64)
	end while Alfa::Token.find_by_token(self.token)
  end
end
