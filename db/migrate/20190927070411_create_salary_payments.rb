class CreateSalaryPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_payments do |t|
      t.date :date
      t.references :department, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
