class ConferenceRecord < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :owner, class_name: 'Conference', foreign_key: 'owner_id'
end
