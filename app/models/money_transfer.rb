class MoneyTransfer < ApplicationRecord
  belongs_to :safe_from, class_name: 'Safe'
  belongs_to :safe_to, class_name: 'Safe'
  belongs_to :user
  belongs_to :money_transfer_type
end
