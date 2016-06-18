class Alfa::Setting < ActiveRecord::Base
  belongs_to :companies
  attr_accessible :name, :value
end
