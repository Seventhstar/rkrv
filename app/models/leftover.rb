class Leftover < ApplicationRecord
  belongs_to :organisation
  belongs_to :safe

  def self.on_date(month, safe_id, organisation_id )
    d = Leftover.where("date_trunc('month', date) = ? AND safe_id = ? AND organisation_id = ?",
                month, safe_id, organisation_id)
    result = 0
    result = d.first.by_hand > 0 ? d.first.by_hand : d.first.calculated if (d.length>0)
    result = {id: d.first&.id, amount: result} 

  end

end
