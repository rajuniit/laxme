class ArchivedExamScore < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  belongs_to :grading_level


  before_save :calculate_grade

  def calculate_percentage
    percentage = self.marks.to_i * 100 / self.exam.maximum_marks
  end
end
