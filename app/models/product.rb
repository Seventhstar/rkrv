class Product < ApplicationRecord
  belongs_to :uom, optional: true
  scope :active, -> {where(active: true)}

  def name_with_mobile_uom_name
    self&.name
  end

  def uom_name
    self&.uom&.name
  end
end