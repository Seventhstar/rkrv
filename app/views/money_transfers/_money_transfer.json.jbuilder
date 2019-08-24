json.extract! money_transfer, :id, :date, :safe_from_id, :safe_to_id, :amount, :comment, :user_id, :created_at, :updated_at
json.url money_transfer_url(money_transfer, format: :json)
