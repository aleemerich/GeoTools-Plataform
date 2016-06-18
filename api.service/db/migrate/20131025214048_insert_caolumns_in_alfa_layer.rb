class InsertCaolumnsInAlfaLayer < ActiveRecord::Migration
  def up
  	add_column :alfa_layers, :fill_opacity, :decimal
  	add_column :alfa_layers, :external_graphic, :string
  end

  def down
  	remove_column :alfa_layers, :fill_opacity
  	remove_column :alfa_layers, :external_graphic
  end
end
