class RemoveToAlpfaLayers < ActiveRecord::Migration
  def up
	remove_column :alfa_layers, :to
  end

  def down
	add_column :alfa_layers, :to, :string
  end
end
