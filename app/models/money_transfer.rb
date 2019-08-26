class MoneyTransfer < ApplicationRecord
  belongs_to :safe_from, class_name: 'Safe'
  belongs_to :safe_to, class_name: 'Safe'
  belongs_to :user
end
