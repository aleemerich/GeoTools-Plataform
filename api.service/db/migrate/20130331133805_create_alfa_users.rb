class CreateAlfaUsers < ActiveRecord::Migration
  def change
    create_table :alfa_users do |t|
      t.belongs_to :company
      t.string :name
      t.string :email
      t.string :password
      t.boolean :blocked
      t.boolean :change_password
      t.date :date_expiration

      t.timestamps
    end
    add_index :alfa_users, :company_id
  end
end
