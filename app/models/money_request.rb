class MoneyRequest < ApplicationRecord
  belongs_to :user
  belongs_to :department

  has_many :money_request_rows,  dependent: :destroy 
  accepts_nested_attributes_for :money_request_rows, allow_destroy: true
end
