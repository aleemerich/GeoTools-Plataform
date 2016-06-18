class InsertFieldDeletedTables < ActiveRecord::Migration
  def up
	add_column :alfa_companies, :deleted, :boolean, :default => false
	add_column :alfa_users, :deleted, :boolean, :default => false
  end

  def down
	remove_column :alfa_companies, :deleted
	remove_column :alfa_users, :deleted
  end
end
