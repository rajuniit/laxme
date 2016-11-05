class AssessmentScore < ApplicationRecord

  belongs_to :student
  belongs_to :descriptive_indicator
  belongs_to :exam

  named_scope :co_scholastic, {:conditions=>{:exam_id=>nil}}
  named_scope :scholastic, {:conditions=>['exam_id > 0']}

end
