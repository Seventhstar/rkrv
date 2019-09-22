class Expense < ApplicationRecord
  belongs_to :safe
  belongs_to :user
  belongs_to :expense_type
  belongs_to :department

  has_paper_trail

  def safe_code1c
    self.safe&.code1c
  end

  def owner_code1c
    self.user&.code1c
  end

  def department_code1c
    self.department&.code1c
  end

end
