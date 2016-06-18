class RenameHashAndName < ActiveRecord::Migration
  def up
  	rename_column :alfa_tables, :name, :fullname
  	rename_column :alfa_tables, :hash, :name
  end

  def down
  	rename_column :alfa_tables, :name, :hash
   	rename_column :alfa_tables, :fullname, :name
  end
end
