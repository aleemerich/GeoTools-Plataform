class Alfa::Layer < ActiveRecord::Base
  belongs_to :worktable
  has_many :company_layer
  has_many :company,
    :through => :company_layer
  attr_accessible :id, :worktable_id, :label, :deleted, :fill_color, :geometry_field, :geometry_field_aux, :geometry_type, :maximum_zoom, :minimum_zoom, :name, :observation, :outline_color, :to, :user
end
