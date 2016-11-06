class StudentPreviousDatas < ApplicationRecord
  belongs_to :student
  validates_presence_of :institution
end
