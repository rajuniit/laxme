class Hr::EmployeePosition < ApplicationRecord
  validates_presence_of :name, :employee_category_id
  validates_uniqueness_of :name,:scope=>:employee_category_id
  scope :active, -> { where(:status => true) }
  belongs_to :employee_category
  has_many :employee
end
