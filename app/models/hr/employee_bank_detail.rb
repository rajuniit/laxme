class Hr::EmployeeBankDetail < ApplicationRecord
  belongs_to :employee
  belongs_to :bank_field
end
