class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :phone
      t.references :department, foreign_key: true
      t.date :in_date
      t.date :out_date
      t.date :birthday
      t.date :medbook

      t.timestamps
    end
  end
end
