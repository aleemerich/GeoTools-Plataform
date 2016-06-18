class CreateAlfaCompanies < ActiveRecord::Migration
  def change
    create_table :alfa_companies do |t|
      t.belongs_to :company
      t.string :name
      t.string :cpnj
      t.string :ie
      t.string :full_adrress
      t.string :contact_name
      t.string :contact_tel
      t.string :contact_cell
      t.boolean :blocked
      t.date :date_expiration

      t.timestamps
    end
    add_index :alfa_companies, :company_id
  end
end
