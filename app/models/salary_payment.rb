class SalaryPayment < ApplicationRecord
  belongs_to :depertment
  belongs_to :user
end
