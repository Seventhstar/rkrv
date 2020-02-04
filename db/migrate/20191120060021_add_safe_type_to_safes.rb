class AddSafeTypeToSafes < ActiveRecord::Migration[5.2]
  def change
    add_column :saves, :safe_type_id, :integer
  end
end
