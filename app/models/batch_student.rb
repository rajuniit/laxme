class BatchStudent < ApplicationRecord

  belongs_to :batch
  belongs_to :student
  belongs_to :school
  validates_presence_of :student_id,:batch_id

end
