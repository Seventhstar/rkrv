class ConferenceRecord < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :folder, class_name: 'Conference', foreign_key: 'folder_id'
  has_many   :attachments,    as: :owner
end
