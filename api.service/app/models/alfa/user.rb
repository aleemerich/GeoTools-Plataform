class Alfa::User < ActiveRecord::Base
  belongs_to :company
  attr_accessible :company_id, :blocked, :change_password, :date_expiration, :email, :name, :password, :deleted
end
