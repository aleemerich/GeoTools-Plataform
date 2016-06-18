class CreateAlfaWorktables < ActiveRecord::Migration
  def change
    create_table :alfa_worktables do |t|
      t.belongs_to :user
      t.string :name
      t.integer :type

      t.timestamps
    end
    add_index :alfa_worktables, :user_id
  end
end
