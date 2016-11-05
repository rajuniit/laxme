class ArchivedEmployeeAdditionalDetail < ApplicationRecord

  belongs_to :archived_employee
  belongs_to :additional_field

end
