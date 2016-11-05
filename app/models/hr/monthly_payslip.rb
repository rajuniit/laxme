class Hr::MonthlyPayslip < ApplicationRecord
  validates_presence_of :salary_date

  belongs_to :payroll_category
  belongs_to :employee
  belongs_to :approver ,:class_name => 'User'
end
