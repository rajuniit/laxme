class FaGroup < ApplicationRecord
  has_many :fa_criterias
  has_and_belongs_to_many :subjects
  belongs_to :cce_exam_category
  has_many :cce_reports, :through=>:fa_criterias

  named_scope :active,:conditions=>{:is_deleted=>false}

  validates_presence_of :name, :max_marks
end
