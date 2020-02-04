class ExpenseSalaryRow < ApplicationRecord
  belongs_to :staff
  belongs_to :expense

  def expense_staff_name
     expense_staff&.name
  end

end
