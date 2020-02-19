class AddOrganisationToMoneyTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column :money_transfers, :o_from_id, :integer
    add_column :money_transfers, :o_to_id, :integer
  end
end
