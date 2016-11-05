class Subject < ApplicationRecord
  belongs_to :batch
  belongs_to :elective_group
  has_many :timetable_entries,:foreign_key=>'subject_id'
  has_many :employees_subjects
  has_many :employees ,:through => :employees_subjects
  has_many :students_subjects
  has_many :students, :through => :students_subjects
  has_many :grouped_exam_reports
  has_and_belongs_to_many_with_deferred_save :fa_groups
  validates_presence_of :name, :max_weekly_classes, :code,:batch_id
  validates_presence_of :credit_hours, :if=>:check_grade_type
  validates_numericality_of :max_weekly_classes
  validates_numericality_of :amount,:allow_nil => true
  validates_uniqueness_of :code, :case_sensitive => false, :scope=>[:batch_id,:is_deleted] ,:if=> 'is_deleted == false'
  named_scope :for_batch, lambda { |b| { :conditions => { :batch_id => b.to_i, :is_deleted => false } } }
  named_scope :without_exams, :conditions => { :no_exams => false, :is_deleted => false }

  before_save :fa_group_valid
end
