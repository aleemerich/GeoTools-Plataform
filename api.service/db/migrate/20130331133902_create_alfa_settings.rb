class CreateAlfaSettings < ActiveRecord::Migration
  def change
    create_table :alfa_settings do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
