class TimeRight < ApplicationRecord
  belongs_to :user, optional: true

  MODELS = [['Расходы', 'Expense'], ['Перемещения', 'MoneyTransfer']]
  
  def modelname
    m = MODELS.select {|a| a[1] == self.model}
    m = m.length >0 ? m[0][0] : ''
    m
  end

  def username 
    self&.user&.name
  end
end
