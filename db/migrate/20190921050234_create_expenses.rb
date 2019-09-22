class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.date :date
      t.integer :amount
      t.references :safe, foreign_key: true
      t.references :expense_type, foreign_key: true
      t.references :department, foreign_key: true
      t.string :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
