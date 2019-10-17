class AddCodeToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :code1c, :string
  end
end
