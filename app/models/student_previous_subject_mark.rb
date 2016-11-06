class StudentPreviousSubjectMark < ApplicationRecord
  belongs_to :student
  validates_presence_of :subject, :mark
end
