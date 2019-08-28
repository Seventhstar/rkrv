class CreateMoneyTransferTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :money_transfer_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
