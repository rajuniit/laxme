class Hr::EmployeeAttendance < ApplicationRecord
  validates_presence_of :employee_leave_type_id, :reason
  validates_uniqueness_of :employee_id, :scope=> :attendance_date
  belongs_to :employee
  belongs_to :employee_leave_type
  before_save :validate
end
