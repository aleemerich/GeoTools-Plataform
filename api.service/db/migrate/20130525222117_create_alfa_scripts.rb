class CreateAlfaScripts < ActiveRecord::Migration
  def change
    create_table :alfa_scripts do |t|
      t.string :script_ids
      t.belongs_to :companies
      t.string :key_action
      t.string :name
      t.string :description
      t.integer :order
      t.boolean :deleted

      t.timestamps
    end
    add_index :alfa_scripts, :companies_id
  end
end
