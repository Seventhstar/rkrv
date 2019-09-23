class AddCode1cToExpenseTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :expense_types, :code1c, :string
  end
end
