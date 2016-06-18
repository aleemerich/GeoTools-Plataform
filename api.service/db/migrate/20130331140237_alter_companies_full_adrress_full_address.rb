class AlterCompaniesFullAdrressFullAddress < ActiveRecord::Migration
  def up
	rename_column :alfa_companies, :full_adrress, :full_address
  end

  def down
	rename_column :alfa_companies, :full_address, :full_adrress
  end
end
