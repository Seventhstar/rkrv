class CreateAccountsLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_links do |t|
      t.integer :user_id
      t.integer :safe_id

      t.timestamps
    end
  end
end
