class CreateAlfaTables < ActiveRecord::Migration
  def change
    create_table :alfa_tables do |t|
      t.string :hash
      t.string :name

      t.timestamps
    end
  end
end
