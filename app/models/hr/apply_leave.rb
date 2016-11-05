class Hr::ApplyLeave < ApplicationRecord
  validates_presence_of :employee_leave_types_id, :start_date, :end_date, :reason
  belongs_to :employee
  belongs_to :employee_leave_type
  before_create :check_leave_count

  cattr_reader :per_page
  @@per_page = 12
end
