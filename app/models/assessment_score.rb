class AssessmentScore < ApplicationRecord

  belongs_to :student
  belongs_to :descriptive_indicator
  belongs_to :exam

  scope :co_scholastic, -> { where(:exam_id => nil) }
  scope :scholastic, -> { where('exam_id > ?', 0) }

end
