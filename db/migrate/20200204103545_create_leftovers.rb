class CreateLeftovers < ActiveRecord::Migration[5.2]
  def change
    create_table :leftovers do |t|
      t.integer :safe_id
      t.integer :organisation_id
      t.bigint :calculated
      t.bigint :by_hand
      t.datetime :date

      t.timestamps
    end
  end
end
