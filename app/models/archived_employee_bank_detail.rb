class ArchivedEmployeeBankDetail < ApplicationRecord

  belongs_to :archived_employee
  belongs_to :bank_field

end
