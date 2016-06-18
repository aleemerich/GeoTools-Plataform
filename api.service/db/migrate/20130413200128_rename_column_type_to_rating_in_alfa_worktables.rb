class RenameColumnTypeToRatingInAlfaWorktables < ActiveRecord::Migration
  def up
	rename_column :alfa_worktables, :type, :rating
  end

  def down
	rename_column :alfa_worktables, :rating, :type
  end
end
