class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :name
      t.integer :parent_id, default: 0

      t.timestamps
    end
  end
end
