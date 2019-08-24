class CreateMoneyTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :money_transfers do |t|
      t.date :date
      t.integer :safe_from
      t.integer :safe_to
      t.integer :amount
      t.string :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
