class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.string :name
      t.string :code1c
      t.references :organisation, foreign_key: true
      t.string :department_code

      t.timestamps
    end
  end
end
