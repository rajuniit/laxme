class Hr::EmployeeDepartment < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name, :code
  has_many :employees
  has_many  :employee_department_events
  has_many  :events,  :through=>:employee_department_events
  scope :active, -> { where(:status => true) }
end
