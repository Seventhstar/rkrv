json.extract! expense, :id, :date, :amount, :safe_id, :expense_type_id, :department_id, :comment, :created_at, :updated_at
json.url expense_url(expense, format: :json)
