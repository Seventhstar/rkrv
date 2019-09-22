class AddSafeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :safe, foreign_key: true
    add_column :users, :code1c, :string
  end
end
