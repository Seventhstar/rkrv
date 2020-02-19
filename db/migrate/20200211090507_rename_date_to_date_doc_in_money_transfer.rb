class RenameDateToDateDocInMoneyTransfer < ActiveRecord::Migration[5.2]
  def change
    rename_column :money_transfers, :date, :doc_date
  end
end
