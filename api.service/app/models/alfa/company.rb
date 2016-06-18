class Alfa::Company < ActiveRecord::Base
  belongs_to :company
  has_many :company_layer
  has_many :layer,
    :through => :company_layer
  attr_accessible :id, :company_id, :blocked, :contact_cell, :contact_name, :contact_tel, :cnpj, :date_expiration, :full_address, :ie, :name, :deleted
end
