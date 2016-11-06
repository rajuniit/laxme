class StudentCategory < ApplicationRecord
  has_many :students
  has_many :fee_category ,:class_name =>"FinanceFeeCategory"
  before_destroy :check_dependence
  validates_presence_of :name
  validates_uniqueness_of :name, :scope=>:is_deleted,:case_sensitive => false, :if=> 'is_deleted == false'

  scope :active, -> { where(:is_deleted => false) }
end
