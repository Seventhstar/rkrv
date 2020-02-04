class CreateExpenseSalaryRows < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_salary_rows do |t|
      t.references :expense, foreign_key: true
      t.references :staff, foreign_key: true
      t.integer :amount
      t.string :comment

      t.timestamps
    end
  end
end
