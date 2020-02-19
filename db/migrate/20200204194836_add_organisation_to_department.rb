class AddOrganisationToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :organisation_id, :integer
  end
end
