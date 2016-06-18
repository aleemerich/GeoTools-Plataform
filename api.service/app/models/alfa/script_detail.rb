class Alfa::ScriptDetail < ActiveRecord::Base
  belongs_to :script
  attr_accessible :deleted, :description, :function_exec, :order, :params, :remote, :script_id
end
