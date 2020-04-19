#json.array! @money_transfers, partial: "money_transfers/money_transfer", as: :money_transfer

json.array!(@money_transfers) do |mt|
  json.extract! mt, :id, :date, :amount, :safe_from_1c, :safe_from_type_id, 
                    :safe_to_1c, :safe_to_type_id, :comment, :owner_code1c, 
                    :dds_from, :dds_to, :money_transfer_type_id, :o_from_code1c, :o_to_code1c
#  json.url absence_url(absence, format: :json)
end
