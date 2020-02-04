class Safe < ApplicationRecord
  belongs_to :organisation
  belongs_to :safe_type
  # has_many :safe_link, foreign_key: :to_id
  # has_many :froms, through: :safe_links, foreign_key: :to_id
  # accepts_nested_attributes_for :safe_link
  # accepts_nested_attributes_for :from, allow_destroy: true
  # accepts_nested_attributes_for :froms, allow_destroy: true
end
