class ArchivedEmployee < ApplicationRecord

  belongs_to  :employee_category
  belongs_to  :employee_position
  belongs_to  :employee_grade
  belongs_to  :employee_department
  belongs_to  :nationality, :class_name => 'Country'
  has_many    :archived_employee_bank_details
  has_many    :archived_employee_additional_details
  before_save :status_false

  def status_false
    unless self.status==0
      self.status=0
    end
  end

end
