class AlterCompaniesCpnjToCnpj < ActiveRecord::Migration
  def up
	rename_column :alfa_companies, :cpnj, :cnpj
  end

  def down
	rename_column :alfa_companies, :cnpj, :cpnj
  end
end
