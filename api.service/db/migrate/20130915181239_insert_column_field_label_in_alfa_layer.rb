class InsertColumnFieldLabelInAlfaLayer < ActiveRecord::Migration
  def up
  	add_column :alfa_layers, :label, :string
  end

  def down
  	remove_column :alfa_layers, :label
  end
end
