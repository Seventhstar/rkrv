class Leftover < ApplicationRecord
  belongs_to :organisation
  belongs_to :safe

  def self.on_date(safe_id, organisation_id, date )
    last = Leftover.where('safe_id = ? AND organisation_id = ? AND date <= ?', 
                           safe_id, organisation_id, date.end_of_day).maximum(:date)

    # d = Leftover.where("date_trunc('month', date) = ? AND safe_id = ? AND organisation_id = ?",
    #             date, safe_id, organisation_id)
    
    d = Leftover.where("date = ? AND safe_id = ? AND organisation_id = ?",
                         last, safe_id, organisation_id)

    if last.present? && last < date 
      _out = self.out(safe_id, organisation_id, last, date)
      _in = self.in(safe_id, organisation_id, last, date)
    else
      _out = 0 
      _in  = 0 
    end

    puts "last #{last}, d #{d.length}"
    if d.length > 0 
      # wejhk
    end

    result = 0
    result = d.first.by_hand > 0 ? d.first.by_hand : d.first.calculated if (d.length>0)
    result = result - _out + _in
    result = {id: d.first&.id, amount: result} 
  end

  def self.out(safe_id, organisation_id, date_from, date_to = nil)
    from = Date.parse(date_from.to_s[0..9])
    to = date_to.nil? ? date_from.end_of_month : date_to

    out = Expense.where("date >= ? AND date <= ? AND safe_id = ? AND organisation_id = (?)", 
                        from, to, safe_id, organisation_id).sum(:amount) + 

    MoneyTransfer.where("doc_date >= ? AND doc_date <= ? AND safe_from_id = ? AND o_from_id = (?)", 
                        from, to, safe_id, organisation_id).sum(:amount)
    out
  end

  def self.in(safe_id, organisation_id, date_from, date_to = nil)
    from = Date.parse(date_from.to_s[0..9])
    to = date_to.nil? ? date_from.end_of_month : date_to
    
    iin   = MoneyTransfer.where("doc_date >= ? AND doc_date <= ? AND safe_to_id = ? AND o_to_id = (?)", 
                                  from.beginning_of_day, to, safe_id, organisation_id).sum(:amount)
  end

end
