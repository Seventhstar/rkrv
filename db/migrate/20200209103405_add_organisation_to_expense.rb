class AddOrganisationToExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :organisation_id, :integer
  end
end
