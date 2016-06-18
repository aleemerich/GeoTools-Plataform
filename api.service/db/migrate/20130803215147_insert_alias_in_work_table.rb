class InsertAliasInWorkTable < ActiveRecord::Migration
  def up
  	add_column :alfa_worktables, :alias, :string
  end

  def down
  	remove_column :alfa_worktables, :alias
  end
end
