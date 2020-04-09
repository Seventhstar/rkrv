class AddActualToOrganisation < ActiveRecord::Migration[5.1]
  def change
    add_column :organisations, :actual, :boolean, default: true
  end
end
