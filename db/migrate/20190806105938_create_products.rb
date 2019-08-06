class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :uom
      t.string :code1c
      t.boolean :active

      t.timestamps
    end
  end
end
