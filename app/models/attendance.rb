class Attendance < ApplicationRecord

  belongs_to :student
  belongs_to :batch

  validates_presence_of :reason,:month_date,:batch_id,:student_id
  validates_uniqueness_of :student_id, :scope => [:month_date],:message=>"already marked as absent"

end
