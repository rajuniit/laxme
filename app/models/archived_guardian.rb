class ArchivedGuardian < ApplicationRecord
  belongs_to :country
  belongs_to :ward, :class_name => 'ArchivedStudent'
end
