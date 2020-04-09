class Organisation < ApplicationRecord
  has_many :departments

  scope :actual, -> { where(actual: true) } 
end
