class CreateConferenceRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :conference_records do |t|
      t.string :name
      t.string :description
      t.integer :folder_id
      t.references :user, foreign_key: true
      t.references :department, foreign_key: true
      t.boolean :admin
      t.date :date_create
      t.date :date_update

      t.timestamps
    end
  end
end
