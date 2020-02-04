class CreateTimeRights < ActiveRecord::Migration[5.2]
  def change
    create_table :time_rights do |t|
      t.string :model
      t.integer :user_id
      t.integer :days

      t.timestamps
    end
  end
end
