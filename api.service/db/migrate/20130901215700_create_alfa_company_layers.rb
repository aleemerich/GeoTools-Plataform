class CreateAlfaCompanyLayers < ActiveRecord::Migration
  def change
    create_table :alfa_company_layers do |t|
      t.belongs_to :company
      t.belongs_to :layer
      t.date :date_expirate

      t.timestamps
    end
    add_index :alfa_company_layers, :company_id
    add_index :alfa_company_layers, :layer_id
  end
end
