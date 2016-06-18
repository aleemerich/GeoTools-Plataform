class InsertCompanieIdInSettings < ActiveRecord::Migration
  def up
  	add_column :alfa_settings, :companie, :integer
  end

  def down
  	remove_column :alfa_settings, :companie_id
  end
end
