json.extract! money_request, :id, :date_start, :date_end, :user_id, :department_id, :amount_cash, :amount_bank, :created_at, :updated_at
json.url money_request_url(money_request, format: :json)
