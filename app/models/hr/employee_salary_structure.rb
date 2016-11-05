class Hr::EmployeeSalaryStructure < ApplicationRecord
  belongs_to :payroll_category
  belongs_to :employee
end
