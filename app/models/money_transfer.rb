class MoneyTransfer < ApplicationRecord
  belongs_to :safe_from, class_name: 'Safe'
  belongs_to :safe_to, class_name: 'Safe'
  belongs_to :user
  belongs_to :money_transfer_type

  has_paper_trail

  def dds_from
    self&.money_transfer_type.dds_code_from_1c
  end

  def dds_to
    self&.money_transfer_type.dds_code_to_1c
  end

  def safe_from_1c
    safe_from&.code1c
  end

  def safe_to_1c
    safe_to&.code1c
  end

  def owner_code1c
    self.user&.code1c
  end
    
end
