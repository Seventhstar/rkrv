class Expense < ApplicationRecord
  belongs_to :safe
  belongs_to :user
  belongs_to :expense_type
  belongs_to :department
  belongs_to :organisation
  has_many :expense_salary_rows

  has_paper_trail

  def from
    self.safe&.name
  end

  def to
    self.department&.name
  end

  def safe_code1c
    self.safe&.code1c
  end

  def owner_code1c
    self.user&.code1c
  end

  def expense_type_code1c
    self.expense_type&.code1c
  end 

  def department_code1c
    self.department&.code1c
  end

end
