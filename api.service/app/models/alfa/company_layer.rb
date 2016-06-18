class Alfa::CompanyLayer < ActiveRecord::Base
  belongs_to :company
  belongs_to :layer
  attr_accessible :date_expirate, :layer_id, :company_id
end
