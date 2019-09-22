# json.array! @expenses, partial: "expenses/expense", as: :expense
json.array! (@expenses) do |ex|
  json.extract! ex, :id, :date, :amount, :safe_code1c, :owner_code1c, :comment, :department_code1c, :expense_type_id
end
