class Conference < ApplicationRecord
  has_many :conferences, foreign_key: 'parent_id' 
end
