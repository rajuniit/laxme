class Batch < ApplicationRecord

  GRADINGTYPES = {"1" => "GPA", "2" => "CWA", "3" => "CCE"}

  belongs_to :course

  has_many :students
  has_many :grouped_exam_reports
  has_many :grouped_batches
  has_many :archived_students
  has_many :grading_levels, -> { where(:is_deleted => false) }
  has_many :subjects, -> { where(:is_deleted => false) }
  has_many :employees_subjects, :through => :subjects
  has_many :exam_groups
  has_many :fee_category, :class_name => "FinanceFeeCategory"
  has_many :elective_groups
  has_many :finance_fee_collections
  has_many :finance_transactions, :through => :students
  has_many :batch_events
  has_many :events, :through => :batch_events
  has_many :batch_fee_discounts, :foreign_key => 'receiver_id'
  has_many :student_category_fee_discounts, :foreign_key => 'receiver_id'
  has_many :attendances
  has_many :subject_leaves
  has_many :timetable_entries
  has_many :cce_reports
  has_many :assessment_scores


  has_and_belongs_to_many :graduated_students, :class_name => 'Student', :join_table => 'batch_students'

  delegate :course_name, :section_name, :code, :to => :course
  delegate :grading_type, :cce_enabled?, :observation_groups, :cce_weightages, :to => :course

  validates_presence_of :name, :start_date, :end_date

  attr_accessor :job_type

  scope :active, -> {
    select("`batches`.*,CONCAT(courses.code,'-',batches.name) as course_full_name").
        joins(:course).
        where(:is_deleted => false, :is_active => true).
        order("course_full_name")
  }
  scope :inactive, -> {
    select("`batches`.*,CONCAT(courses.code,'-',batches.name) as course_full_name").
        joins(:course).
        where(:is_deleted => false, :is_active => false).
        order("course_full_name")
  }
  scope :deleted, -> {
    select("`batches`.*,CONCAT(courses.code,'-',batches.name) as course_full_name").
        joins(:course).
        where(:is_deleted => true).
        order("course_full_name")
  }
  scope :cce, -> {
    select("batches.*").
        where("courses.grading_type = ?", GRADINGTYPES.invert["CCE"])
        joins(:course).
        order(:code)
  }
end
