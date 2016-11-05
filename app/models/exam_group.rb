class ExamGroup < ApplicationRecord

  validates_presence_of :name

  belongs_to :batch
  belongs_to :grouped_exam

  has_many :exams, :dependent => :destroy
  before_destroy :removable?
  belongs_to :cce_exam_category

  accepts_nested_attributes_for :exams

  attr_accessor :maximum_marks, :minimum_marks, :weightage
  validates_associated :exams

  validates_uniqueness_of :cce_exam_category_id, :scope=>:batch_id, :message=>"already assigned for another Exam Group",:unless => lambda { |e| e.cce_exam_category_id.nil?}

end
