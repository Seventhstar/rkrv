class AddOwnerToSafe < ActiveRecord::Migration[5.2]
  def change
    add_column :saves, :owner_id, :integer
  end
end
