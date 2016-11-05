class CceWightage < ApplicationRecord

  has_and_belongs_to_many :courses
  belongs_to              :cce_exam_category
  validates_presence_of :weightage,:criteria_type

end
