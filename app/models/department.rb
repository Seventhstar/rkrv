class Department < ApplicationRecord
  belongs_to :organisation, optional: true
end
