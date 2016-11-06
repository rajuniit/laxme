class Hr::EmployeeGrade < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, :priority
  validates_numericality_of :priority

  has_many :employee
  scope :active, -> { where(:status => true) }
end
