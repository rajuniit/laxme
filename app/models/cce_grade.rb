class CceGrade < ApplicationRecord

  belongs_to    :cce_grade_set
  validates_presence_of :name
  validates_presence_of :grade_point
  validates_numericality_of :grade_point

end
