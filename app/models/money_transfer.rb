class MoneyTransfer < ApplicationRecord
  belongs_to :safe_from
  belongs_to :safe_to
  belongs_to :user
end
