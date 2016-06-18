class InsertDeletedInTemplates < ActiveRecord::Migration
  def up
  	add_column :alfa_templates, :deleted, :boolean, :default => false
  end

  def down
  	remove_column :alfa_templates, :deleted
  end
end
