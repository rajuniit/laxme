class Hr::EmployeeCategory < ApplicationRecord
  validates_presence_of :name, :prefix
  validates_uniqueness_of :name, :prefix
  scope :active, -> { where(:status => true) }
  has_many :employee_positions
  has_many :employees
end
