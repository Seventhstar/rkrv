class CreateUoms < ActiveRecord::Migration[5.2]
  def change
    create_table :uoms do |t|
      t.string :name
      t.string :mobile_app_name

      t.timestamps
    end
  end
end
