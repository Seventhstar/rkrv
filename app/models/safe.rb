class Safe < ApplicationRecord
  belongs_to :organisation
  belongs_to :safe_type

  has_many :to_links, class_name: 'SafeLink', foreign_key: :from_id
  has_many :tos, through: :to_links

  has_many :from_links, class_name: 'SafeLink', foreign_key: :to_id 
  has_many :froms, through: :from_links


  scope :actual, ->{where(actual: true)} 
end
