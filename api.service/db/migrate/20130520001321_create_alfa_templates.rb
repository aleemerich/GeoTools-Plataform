class CreateAlfaTemplates < ActiveRecord::Migration
  def change
    create_table :alfa_templates do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
