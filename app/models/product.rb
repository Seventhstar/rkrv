class Product < ApplicationRecord

  scope :active, -> {where(active: true)}
end
