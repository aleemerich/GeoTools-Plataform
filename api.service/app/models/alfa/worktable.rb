class Alfa::Worktable < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :name, :rating, :alias
end
