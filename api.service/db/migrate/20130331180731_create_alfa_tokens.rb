class CreateAlfaTokens < ActiveRecord::Migration
  def change
    create_table :alfa_tokens do |t|
      t.string :token
      t.date :expires_at
      t.belongs_to :user
      t.text :rules

      t.timestamps
    end
    add_index :alfa_tokens, :user_id
  end
end
