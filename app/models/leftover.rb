class Leftover < ApplicationRecord
  belongs_to :organisation
  belongs_to :safe

  def self.on_date(safe_id, organisation_id, date )
    last = Leftover.where('safe_id = ? AND organisation_id = ? AND date <= ?', 
                           safe_id, organisation_id, date.end_of_day).maximum(:date)

    d = Leftover.where("date = ? AND safe_id = ? AND organisation_id = ?",
                         last, safe_id, organisation_id)

    if !last.present?
      last = Date.new(2020,1,31)
      d    = 0
    end

    if last.present? && last.to_date != date-1.day && last.to_date != date
      _out = self.out(safe_id, organisation_id, last, date).to_i
      _in = self.in(safe_id, organisation_id, last, date).to_i
    else
      _out = 0 
      _in  = 0 
    end

    result = 0
    if !d.is_a?(Integer) && d.length > 0
      bh = d.first.by_hand.nil? ? 0 : d.first.by_hand.to_i
      result = (bh > 0 || d.first.forced )? d.first.by_hand : d.first.calculated 
      id = d.first&.id
    end

    
      
    if date == date.beginning_of_month && last.to_date != date-1.day && last.to_date != date
      end_of_last_month = date-1.day
      _out = self.out(safe_id, organisation_id, last, end_of_last_month).to_i
      _in = self.in(safe_id, organisation_id, last, end_of_last_month).to_i

      new_lo = d.is_a?(Integer) ? d : ((d.first.by_hand.to_i > 0 || d.first.forced) ? d.first.by_hand : d.first.calculated)
      new_lo = new_lo + _in - _out

      if new_lo>0
        l = Leftover.create({safe_id: safe_id, organisation_id: organisation_id, calculated: new_lo, date: end_of_last_month}) 
        id = l.id
      end
    end

    result = result.to_i - _out.to_i + _in.to_i
    result = {id: id, amount: result} 
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
