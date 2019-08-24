class ChangeUomInProducts < ActiveRecord::Migration[5.2]
  def change
     rename_column :products, :uom, :uom_id
  end
end
