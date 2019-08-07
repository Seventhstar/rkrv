class CreateProductLeftovers < ActiveRecord::Migration[5.2]
  def change
    create_table :product_leftovers do |t|
      t.references :product
      t.references :store, foreign_key: true
      t.date :date
      t.decimal :count, precision: 10, scale: 2

      t.timestamps
    end
  end
end
