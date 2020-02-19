class Safe < ApplicationRecord
  belongs_to :organisation
  belongs_to :safe_type

  has_many :tos, class_name: 'SafeLink', foreign_key: :from_id

  has_many :from_links, class_name: 'SafeLink', foreign_key: :from_id 
  has_many :froms, through: :from_links


  scope :actual, ->{where(actual: true)} 
end
