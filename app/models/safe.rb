class Safe < ApplicationRecord
  belongs_to :organisation, optional: true
  belongs_to :safe_type
  belongs_to :user, foreign_key: :owner_id, optional: true

  has_many :to_links, class_name: 'SafeLink', foreign_key: :from_id
  has_many :tos, through: :to_links

  has_many :from_links, class_name: 'SafeLink', foreign_key: :to_id 
  has_many :froms, through: :from_links


  scope :actual, -> { where(actual: true) } 
end
