class AddCodesToMoneyTransferTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :money_transfer_types, :dds_code_from_1c, :string
    add_column :money_transfer_types, :dds_code_to_1c, :string
  end
end
