class InsertDeletedInAlfaWorktables < ActiveRecord::Migration
  def up
	add_column :alfa_worktables, :deleted, :boolean, :default => false
  end

  def down
	remove_column :alfa_worktables, :deleted
  end
end
