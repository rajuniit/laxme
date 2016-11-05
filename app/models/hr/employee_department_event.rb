class Hr::EmployeeDepartmentEvent < ApplicationRecord
  belongs_to :event
  belongs_to :employee_department
end
