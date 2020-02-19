class AddActualToSaves < ActiveRecord::Migration[5.2]
  def change
    add_column :saves, :actual, :boolean, default: true
  end
end
