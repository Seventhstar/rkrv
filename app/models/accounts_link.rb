class AccountsLink < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :account, class_name: 'Safe', foreign_key: :safe_id
end
