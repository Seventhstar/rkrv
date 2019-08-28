class AddTypeToMoneyTransfers < ActiveRecord::Migration[5.2]
  def change
    add_reference :money_transfers, :money_transfer_type, foreign_key: true, default: 1
  end
end
