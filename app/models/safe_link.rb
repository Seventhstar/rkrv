class SafeLink < ApplicationRecord
  belongs_to :from, class_name: 'Safe', foreign_key: :to_id
  belongs_to :to, class_name: 'Safe', foreign_key: :from_id
end
