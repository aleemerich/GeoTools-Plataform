class CreateAlfaLayers < ActiveRecord::Migration
  def change
    create_table :alfa_layers do |t|
      t.belongs_to :worktable
      t.belongs_to :user
      t.string :to
      t.string :name
      t.integer :geometry_type
      t.string :geometry_field
      t.string :geometry_field_aux
      t.string :outline_color
      t.string :fill_color
      t.decimal :maximum_zoom
      t.decimal :minimum_zoom
      t.text :observation
      t.boolean :deleted

      t.timestamps
    end
    add_index :alfa_layers, :worktable_id
  end
end
