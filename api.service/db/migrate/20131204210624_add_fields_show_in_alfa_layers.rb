class AddFieldsShowInAlfaLayers < ActiveRecord::Migration
  def up
  	add_column :alfa_layers, :fields_show, :text
  end

  def down
  	remove_column :alfa_layers, :fields_show
  end
end
