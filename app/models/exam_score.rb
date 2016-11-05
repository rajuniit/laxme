class ExamScore < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :grading_level

  before_save :calculate_grade
  before_save :check_existing


  validates_presence_of :student_id
  validates_presence_of :exam_id,:message =>  "Name/Batch Name/Subject Code is invalid"
  validates_numericality_of :marks,:allow_nil => true



  def check_existing
    exam_score = ExamScore.find(:first,:conditions => {:exam_id => self.exam_id,:student_id => self.student_id})
    if exam_score
      self.id = exam_score.id
      self.instance_variable_set("@new_record",false)    #If the record exists,then make the new record as a copy of the existing one and allow rails to chhose
      #the update operation instead of insert.
    end
    return true
  end
end
