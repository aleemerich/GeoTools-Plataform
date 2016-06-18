class CreateAlfaScriptDetails < ActiveRecord::Migration
  def change
    create_table :alfa_script_details do |t|
      t.string :script_detail_id
      t.belongs_to :script
      t.string :function_exec
      t.string :description
      t.text :params
      t.integer :order
      t.boolean :remote
      t.boolean :deleted

      t.timestamps
    end
  end
end
