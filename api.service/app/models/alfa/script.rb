class Alfa::Script < ActiveRecord::Base
  belongs_to :company
  attr_accessible :deleted, :description, :key_action, :name, :order, :script_ids, :company_id
end
