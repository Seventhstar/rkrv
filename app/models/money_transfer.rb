class MoneyTransfer < ApplicationRecord
  belongs_to :safe_from, class_name: 'Safe'
  belongs_to :safe_to, class_name: 'Safe'
  belongs_to :user
  belongs_to :o_from, class_name: 'Organisation', foreign_key: 'o_from_id'
  belongs_to :o_to, class_name: 'Organisation', foreign_key: 'o_to_id'
  belongs_to :money_transfer_type

  has_paper_trail

  def from
    self.safe_from&.name
  end

  def to
    self.safe_to&.name
  end

  def o_from_code1c
    self.o_from&.code1c
  end

  def o_to_code1c
    self.o_to&.code1c
  end

  def date
    self.doc_date
  end

  def dds_from
    self&.money_transfer_type.dds_code_from_1c
  end

  def dds_to
    self&.money_transfer_type.dds_code_to_1c
  end

  def safe_from_1c
    safe_from&.code1c
  end

  def safe_from_type_id
    safe_from&.safe_type_id
  end

  def safe_to_1c
    safe_to&.code1c
  end

  def safe_to_type_id
    safe_to&.safe_type_id
  end

  def owner_code1c
    self.user&.code1c
  end
    
end
