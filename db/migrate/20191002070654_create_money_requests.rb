class CreateMoneyRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :money_requests do |t|
      t.date :date_start
      t.date :date_end
      t.references :user, foreign_key: true
      t.references :department, foreign_key: true
      t.integer :amount_cash
      t.integer :amount_bank

      t.timestamps
    end
  end
end
