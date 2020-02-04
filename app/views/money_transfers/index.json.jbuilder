#json.array! @money_transfers, partial: "money_transfers/money_transfer", as: :money_transfer

json.array!(@money_transfers) do |mt|
  json.extract! mt, :id, :date, :amount, :safe_from_1c, :safe_to_1c, :comment, :owner_code1c, :dds_from, :dds_to, :money_transfer_type_id
#  json.url absence_url(absence, format: :json)
end
