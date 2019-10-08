class CreateMoneyRequestRows < ActiveRecord::Migration[5.2]
  def change
    create_table :money_request_rows do |t|
      t.date :date
      t.references :department, foreign_key: true
      t.boolean :cash
      t.string :purpose
      t.integer :amount

      t.timestamps
    end
  end
end
