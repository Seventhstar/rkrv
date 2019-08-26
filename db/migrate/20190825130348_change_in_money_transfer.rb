class ChangeInMoneyTransfer < ActiveRecord::Migration[5.2]
  def change
    rename_column :money_transfers, :safe_from, :safe_from_id
    rename_column :money_transfers, :safe_to, :safe_to_id
  end
end
