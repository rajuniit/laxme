class SubjectLeave < ApplicationRecord
  belongs_to :student
  belongs_to :batch
  validates_presence_of :subject_id
  validates_presence_of :batch_id
  validates_presence_of :student_id
  validates_presence_of :month_date
  validates_presence_of :reason
  scope :by_month_and_subject, -> (d,s) { where(:month_date  => d.beginning_of_month..d.end_of_month , :subject_id => s) }
  scope :by_month_batch_subject,-> (d,b,s) { where(:month_date  => d.beginning_of_month..d.end_of_month , :subject_id => s,:batch_id=>b) }
  validates_uniqueness_of :student_id,:scope=>[:class_timing_id,:month_date],:message=>"already marked as absent"
end
